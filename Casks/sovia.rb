cask "sovia" do
  version "0.4.1"
  sha256 "4c578977ead036d530d2bc113978fd28b7c7d5aff6df2b9588814e08eaf493ff"

  url "https://github.com/rewolc/sovia-releases/releases/download/v#{version}/Sovia-mac-arm64.dmg"
  name "Sovia"
  desc "Desktop AI copilot for technical interviews"
  homepage "https://sovia.space"

  app "Sovia.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Sovia.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Sovia",
    "~/Library/Logs/Sovia",
    "~/Library/Preferences/com.sovia.plist",
  ]
end