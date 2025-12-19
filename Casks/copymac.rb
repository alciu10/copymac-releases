cask "copymac" do
  version "1.8.2"
  sha256 "c97a4c9f8aa32afe3745002010817a75a667be7b97a54fe630f603625c71e487"

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
