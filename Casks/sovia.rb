cask "sovia" do
  version "0.4.0"
  sha256 "8a4b9907c91cffe0586fbc3670e3e4c8c1412f6584a38168608f0fdfac6ca9de"

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
