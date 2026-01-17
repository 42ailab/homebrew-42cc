# 42cc 的 Homebrew Cask Tap

[42cc](https://42cc.42ailab.com) 的官方 Homebrew tap - Claude Code 模型配置工具。

## 安装

```bash
# 添加 tap
brew tap 42ailab/42cc

# 安装 42cc
brew install --cask 42cc

# 验证安装
open -a 42cc
```

## 更新

```bash
brew update
brew upgrade --cask 42cc
```

## 卸载

```bash
brew uninstall --cask 42cc
brew untap 42ailab/42cc
```

## 文档

- **主项目**: https://42cc.42ailab.com
- **问题反馈**: https://cnb.cool/42ailab/42plugin/meta/-/issues

## Cask 维护

Cask 文件位于: `Casks/42cc.rb`

### 自动更新机制

本仓库使用双重机制确保 Cask 及时更新:

#### 1️⃣ **主要方式: Webhook 实时触发** (推荐 ⭐)

- **触发时机**: 42cc 发布新版本时自动触发
- **延迟**: < 1 分钟（秒级响应）
- **工作流**: `.github/workflows/webhook-update.yml`
- **流程**:
  1. 42cc 发布流程完成后，自动计算 DMG 的 SHA256
  2. 发送 `repository_dispatch` webhook 到本仓库
  3. Webhook 触发 GitHub Actions 自动更新 Cask 文件
  4. 自动提交 commit: `chore: auto-update to x.x.x (webhook triggered)`

#### 2️⃣ **兜底方式: 定时检测**

- **触发时机**: 每周日北京时间凌晨 3:00
- **目的**: 确保即使 webhook 失败，也能通过定时任务最终更新
- **工作流**: `.github/workflows/auto-update.yml`
- **流程**:
  1. 检查 `https://get.42plugin.com/42cc/version.json`
  2. 如果检测到新版本，自动更新 Cask 文件
  3. 自动提交 commit: `chore: update 42cc to x.x.x (fallback check)`

### 手动触发更新

你也可以在 [Actions 标签页](https://github.com/xlgwr/homebrew-42cc/actions) 手动触发任一工作流。
