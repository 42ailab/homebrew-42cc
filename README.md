# Homebrew Cask Tap for 42cc

Official Homebrew tap for [42cc](https://github.com/42ailab) - Claude Code model configuration tool.

## Installation

```bash
# Add the tap
brew tap 42ailab/42cc

# Install 42cc
brew install --cask 42cc

# Verify installation
open -a 42cc
```

## Updating

```bash
brew update
brew upgrade --cask 42cc
```

## Uninstallation

```bash
brew uninstall --cask 42cc
brew untap 42ailab/42cc
```

## Documentation

- **Main Project**: https://github.com/42ailab
- **Issues**: https://cnb.cool/42ailab/42plugin/meta/-/issues

## Cask Maintenance

The Cask file is located at: `Casks/42cc.rb`

### Automatic Updates

This repository uses GitHub Actions to automatically update the Cask when a new version is released:

1. The workflow checks `https://get.42plugin.com/42cc/version.json` daily at 3:00 AM (Beijing Time)
2. If a new version is detected, it automatically updates `version` and `sha256` in the Cask file
3. Changes are committed and pushed automatically

You can also trigger the update manually from the Actions tab.

### Manual Update

If needed, you can update manually:

1. Build new DMG in the main repository
2. Upload DMG to CDN: `https://get.42plugin.com/42cc/v{version}/`
3. Update `version.json` with new version and SHA256
4. Wait for auto-update, or trigger it manually

## License

Proprietary
