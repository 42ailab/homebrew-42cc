cask "42cc" do
  version "0.3.14"
  sha256 "00d28cc4359700e1336124d1506eacdd693eb2b196c94bbd4de4d86ed0becd9f"

  url "https://get.42plugin.com/42cc/v#{version}/42cc-#{version}.dmg"
  name "42cc"
  desc "Claude Code model configuration tool"
  homepage "https://42ailab.com"

  livecheck do
    url "https://get.42plugin.com/42cc/version.json"
    strategy :json do |json|
      json["version"]
    end
  end

  depends_on macos: ">= :high_sierra"

  app "42cc.app"

  zap trash: [
    "~/Library/Application Support/com.42ailab.cc42",
    "~/Library/Preferences/com.42ailab.cc42.plist",
    "~/Library/Caches/com.42ailab.cc42",
    "~/Library/Saved Application State/com.42ailab.cc42.savedState",
  ]
end
