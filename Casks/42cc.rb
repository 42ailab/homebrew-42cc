cask "42cc" do
  version "0.10.15"
  sha256 "98af33453d4b2efbfdee9d0801765f39b593299bc6a06e7ca66c77fbcccb95a4"

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
