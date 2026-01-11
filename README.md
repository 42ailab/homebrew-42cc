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

Update workflow:
1. Build new DMG in the main repository
2. Upload DMG to GitHub Releases
3. Calculate SHA256: `shasum -a 256 42cc-x.y.z.dmg`
4. Update `version` and `sha256` in the Cask file
5. Commit and push

## License

Proprietary
