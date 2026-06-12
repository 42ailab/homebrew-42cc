#!/usr/bin/env bash
#
# 校验并更新 Casks/42cc.rb
# 用法: ./scripts/update-cask.sh <version> <sha256>
#
# 两个 workflow（webhook-update / auto-update）共用此脚本，更新逻辑单源：
# 1. 格式校验（2026-03 曾因 CDN 地址错误把空版本写进 cask 并 push，此处封死）
# 2. 下载 CDN 实际分发的 DMG 核对 sha256（cask 必须匹配用户真正下载到的内容，
#    不一致说明 CDN 缓存未刷新或上传出错，拒绝更新并报警）
# 3. 行锚定 sed 更新 version / sha256
# 4. ruby 语法检查，防止写坏 cask 导致所有用户 brew tap 报错
#
set -euo pipefail

VERSION="${1:-}"
SHA256="${2:-}"
CASK="Casks/42cc.rb"
DMG_TMP="$(mktemp /tmp/42cc-XXXXXX.dmg)"
trap 'rm -f "$DMG_TMP"' EXIT

if ! [[ "$VERSION" =~ ^[0-9]+\.[0-9]+\.[0-9]+([-.][0-9A-Za-z.]+)?$ ]]; then
    echo "ERROR: version 格式非法: '${VERSION}'" >&2
    exit 1
fi
if ! [[ "$SHA256" =~ ^[0-9a-f]{64}$ ]]; then
    echo "ERROR: sha256 格式非法: '${SHA256}'" >&2
    exit 1
fi

URL="https://cdn.42plugin.com/42cc/v${VERSION}/42cc-${VERSION}.dmg"
echo "下载 CDN 实际产物核对 sha256: ${URL}"

ACTUAL=""
MAX_ATTEMPTS=10
for i in $(seq 1 "$MAX_ATTEMPTS"); do
    if curl -fsSL -o "$DMG_TMP" "$URL"; then
        ACTUAL="$(shasum -a 256 "$DMG_TMP" | awk '{print $1}')"
        if [[ "$ACTUAL" == "$SHA256" ]]; then
            break
        fi
        echo "第 ${i}/${MAX_ATTEMPTS} 次: CDN 产物 sha256=${ACTUAL} 与期望不符（可能边缘缓存未刷新）"
    else
        echo "第 ${i}/${MAX_ATTEMPTS} 次: 下载失败（可能产物尚未就绪）"
    fi
    if [[ "$i" -lt "$MAX_ATTEMPTS" ]]; then
        sleep 30
    fi
done

if [[ "$ACTUAL" != "$SHA256" ]]; then
    echo "ERROR: CDN 实际产物 sha256 与期望不一致，拒绝更新" >&2
    echo "  期望: ${SHA256}" >&2
    echo "  实际: ${ACTUAL:-下载失败}" >&2
    echo "  请检查 CDN 上传是否完成、缓存是否刷新" >&2
    exit 1
fi
echo "CDN 产物核对通过"

# perl -pi 在 macOS / Linux 行为一致（BSD sed 的 -i 参数不同）
perl -pi -e "s|^  version \".*\"|  version \"${VERSION}\"|" "$CASK"
perl -pi -e "s|^  sha256 \".*\"|  sha256 \"${SHA256}\"|" "$CASK"

ruby -c "$CASK"

echo "OK: ${CASK} 已更新到 ${VERSION}"
