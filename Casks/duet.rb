cask "duet" do
  version "0.1.1"
  sha256 "8b59b84c2eea5521ec8db5241743f6e20a4836c2175d4730d59253b2146c01e1"

  url "https://github.com/harsha509/duet-releases/releases/download/v#{version}/Duet-#{version}-arm64.dmg"
  name "Duet"
  desc "A code editor where one model writes and another reviews"
  homepage "https://github.com/harsha509/duet-releases"

  depends_on arch: :arm64
  depends_on macos: ">= :monterey"

  app "Duet.app"

  # This build is not notarized, so macOS would refuse to open it while it
  # carries the download quarantine mark.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Duet.app"]
  end

  zap trash: [
    "~/Library/Application Support/Duet",
    "~/Library/Preferences/com.duetcode.desktop.plist",
    "~/Library/Saved Application State/com.duetcode.desktop.savedState",
  ]
end
