# 42cc 的 Homebrew Cask Tap

[42cc](https://github.com/42ailab) 的官方 Homebrew tap - Claude Code 模型配置工具。

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

- **主项目**: https://github.com/42ailab
- **问题反馈**: https://cnb.cool/42ailab/42plugin/meta/-/issues

## Cask 维护

Cask 文件位于: `Casks/42cc.rb`

### 自动更新

本仓库使用 GitHub Actions 在发布新版本时自动更新 Cask:

1. 工作流每天北京时间凌晨 3:00 检查 `https://get.42plugin.com/42cc/version.json`
2. 如果检测到新版本,会自动更新 Cask 文件中的 `version` 和 `sha256`
3. 更改会自动提交并推送

你也可以在 Actions 标签页手动触发更新。
