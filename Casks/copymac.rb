cask "copymac" do
  version "1.8.3"
  sha256 "006ca060e4403918627370c704d948aa5d3913580a98e885f49181f5af6b4002"

  url "https://github.com/alciu10/copymac-releases/releases/download/v#{version}/CopyMac-#{version}.zip"
  name "CopyMac"
  desc "Fast, lightweight clipboard manager for macOS"
  homepage "https://github.com/alciu10/copymac-releases"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "CopyMac.app"

  postflight do
    system_command "/usr/bin/open", args: ["-a", "CopyMac"]
  end

  uninstall quit: "com.alciu10.copymac"

  zap trash: [
    "~/Library/Preferences/com.alciu10.copymac.plist",
    "~/Library/Application Support/CopyMac",
    "~/Library/Caches/com.alciu10.copymac"
  ]
end
