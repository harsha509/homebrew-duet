cask "duet" do
  version "0.1.5"
  sha256 "26d0022e3feb857d926832b5132c1282a76dba35390b423c0b758040de722a04"

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
