cask "copymac" do
  version "1.8.1"
  sha256 "b1922aeaa3762b2bb7856b92db02b48110190e3b547ea534a5e34ccd674ad2bd"

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
