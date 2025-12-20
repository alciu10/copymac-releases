cask "copymac" do
  version "1.8.4"
  sha256 "fc9afb01b4bcc72065a670008ddbb704a2f9a075ee1cd975cdc37e49fedf7e1a"

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
