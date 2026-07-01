cask "42cc" do
  version "0.10.8"
  sha256 "c7f3aa9b8d66972d56a75a514caaaffd91245501679ccda028725fa82eac8c08"

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
