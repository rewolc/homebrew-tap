cask "sovia" do
  version "0.4.3"
  sha256 "4c26c26534715c5fe9fd71a27ce5245028083951f5a2425c421c2be57c1eca7f"

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