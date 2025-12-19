cask "copymac" do
  version "1.8.0"
  sha256 "ff44c8d0653307365d1d15ee155db095c373fc55ea4d162f458db21f2ed67745"

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
