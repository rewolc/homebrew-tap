cask "sovia" do
  version "0.4.2"
  sha256 "a1c6b602d35484d3936ef4b880e00552f8d95fd78cbd7e71b17f4ce73faede8c"

  url "https://github.com/rewolc/sovia-releases/releases/download/v\#{version}/Sovia-mac-arm64.dmg"
  name "Sovia"
  desc "Desktop AI copilot for technical interviews"
  homepage "https://sovia.space"

  app "Sovia.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "\#{appdir}/Sovia.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Sovia",
    "~/Library/Logs/Sovia",
    "~/Library/Preferences/com.sovia.plist",
  ]
end