cask "42cc" do
  version "0.7.14"
  sha256 "606958843b441198e92edf7bedd955722b348628aa8c24de8be1d0f32d8a24b4"

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

  app "42cc.app"

  zap trash: [
    "~/Library/Application Support/com.42ailab.cc42",
    "~/Library/Preferences/com.42ailab.cc42.plist",
    "~/Library/Caches/com.42ailab.cc42",
    "~/Library/Saved Application State/com.42ailab.cc42.savedState",
  ]
end
