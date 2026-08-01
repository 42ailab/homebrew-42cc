cask "42cc" do
  version "0.10.12"
  sha256 "cd0956a774e4669c2f3adab07a726472f013409f29920b7bec0563a2618442e4"

  url "https://cdn.42plugin.com/42cc/v#{version}/42cc-#{version}.dmg"
  name "42cc"
  desc "Claude Code model configuration tool"
  homepage "https://42cc.42ailab.com"

  livecheck do
    url "https://cdn.42plugin.com/42cc/version.json"
    strategy :json do |json|
      json["version"]
    end
  end

  # 应用内置更新器（core/updater）会自替换 .app，
  # brew upgrade 默认跳过，--greedy 才强制重装
  auto_updates true
  depends_on macos: ">= :high_sierra"

  app "42cc.app"

  zap trash: [
    "~/.42cc",
    "~/Library/Application Support/com.42ailab.cc42",
    "~/Library/Preferences/com.42ailab.cc42.plist",
    "~/Library/Caches/com.42ailab.cc42",
    "~/Library/Saved Application State/com.42ailab.cc42.savedState",
  ]
end
