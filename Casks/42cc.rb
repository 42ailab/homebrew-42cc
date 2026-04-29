cask "42cc" do
  version "0.8.0"
  sha256 "7560cdccb9e175bc6c4fa3ea1930385f753495fe295f7616f7664cd82a3b106b"

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
