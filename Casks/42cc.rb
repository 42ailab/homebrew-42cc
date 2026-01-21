cask "42cc" do
  version "0.3.16"
  sha256 "ec5541256ae0b723fef86a381e80ec16cfe7f5933eefdb147671ee59d6a93b07"

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

  depends_on macos: ">= :high_sierra"

  app "42cc.app"

  zap trash: [
    "~/Library/Application Support/com.42ailab.cc42",
    "~/Library/Preferences/com.42ailab.cc42.plist",
    "~/Library/Caches/com.42ailab.cc42",
    "~/Library/Saved Application State/com.42ailab.cc42.savedState",
  ]
end
