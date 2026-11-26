cask "duet" do
  version "0.1.4"
  sha256 "6f13b9e91cf17ef34ec5eec700141b3a3438cf61e29c923fec06c9b6fa635129"

  url "https://github.com/harsha509/duet-releases/releases/download/v#{version}/Duet-#{version}-arm64.dmg"
  name "Duet"
  desc "A code editor where one model writes and another reviews"
  homepage "https://github.com/harsha509/duet-releases"

  depends_on arch: :arm64
  depends_on macos: :monterey

  app "Duet.app"

  # This build is not notarized, so macOS would refuse to open it while it
  # carries the download quarantine mark.
  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/Duet.app"]
  end

  zap trash: [
    "~/Library/Application Support/Duet",
    "~/Library/Preferences/com.duetcode.desktop.plist",
    "~/Library/Saved Application State/com.duetcode.desktop.savedState",
  ]
end
