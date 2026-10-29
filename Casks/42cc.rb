cask "42cc" do
  version "0.10.17"
  sha256 "b37921e20375902ade89e173e76b584be500e2c4050f9f2e6a4e041a661c480c"

  url "https://cdn.42plugin.com/42cc/v#{version}/42cc-#{version}.dmg"
  name "42cc"
  desc "Claude Code model configuration tool"
  homepage "https://42cc.42ailab.com/"

  livecheck do
    url "https://cdn.42plugin.com/42cc/version.json"
    strategy :json do |json|
      json["version"]
    end
  end

  # 应用内置更新器（core/updater）会自替换 .app，
  # brew upgrade 默认跳过，--greedy 才强制重装
  auto_updates true
  depends_on :macos

  app "42cc.app"

  zap trash: [
    "~/.42cc",
    "~/Library/Application Support/com.42ailab.cc42",
    "~/Library/Caches/com.42ailab.cc42",
    "~/Library/Preferences/com.42ailab.cc42.plist",
    "~/Library/Saved Application State/com.42ailab.cc42.savedState",
  ]
end
