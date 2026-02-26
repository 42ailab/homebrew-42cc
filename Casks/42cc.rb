cask "42cc" do
  version "0.7.2"
  sha256 "88d0e05f9a857ba14be2692ee3f2565368d4aac421dfbfa4f7578d4a94d75d91"

  url "https://get.42plugin.com/42cc/v#{version}/42cc-#{version}.dmg"
  name "42cc"
  desc "Claude Code model configuration tool"
  homepage "https://42cc.42ailab.com"

  livecheck do
    url "https://get.42plugin.com/42cc/version.json"
    strategy :json do |json|
      json["version"]
    end
  end

  app "42cc.app"

  zap trash: [
    "~/Library/Application Support/com.42ailab.cc42",
    "~/Library/Preferences/com.42ailab.cc42.plist",
    "~/Library/Caches/com.42ailab.cc42",
    "~/Library/Saved Application State/com.42ailab.cc42.savedState",
  ]
end
