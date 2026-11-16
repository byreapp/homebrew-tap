cask "byre" do
  arch arm: "apple-silicon", intel: "intel"

  version "0.4.2"
  sha256 arm:   "dc4d2b177c38bacda34aeaf2a10380b6ac53440da6c0cb88ea45adae0c0da210",
         intel: "f03654d33ea861a0187284088d479c6322a22102fe49720a6042b1094edcdaf9"

  url "https://github.com/byreapp/byre-releases/releases/download/v#{version}/Byre-mac-#{arch}.dmg"
  name "Byre"
  desc "Local database servers and database studio"
  homepage "https://byre.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on :macos

  app "Byre.app"
  binary "#{appdir}/Byre.app/Contents/MacOS/byre"

  zap trash: [
    "~/.byre",
    "~/Library/Application Support/app.byre.desktop",
    "~/Library/Caches/app.byre.desktop",
    "~/Library/LaunchAgents/Byre.plist",
    "~/Library/Preferences/app.byre.desktop.plist",
    "~/Library/WebKit/app.byre.desktop",
  ]
end
