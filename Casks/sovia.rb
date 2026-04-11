cask "sovia" do
  version "0.4.5"
  sha256 "00d6c3b6b7d4b5d557be9d88a70580d9a5cd21253b3313a56b44b91581fd25b8"

  url "https://github.com/rewolc/sovia-releases/releases/download/v0.4.5/Sovia-mac-arm64.dmg"
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