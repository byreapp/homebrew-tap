cask "byre" do
  arch arm: "apple-silicon", intel: "intel"

  version "0.4.0"
  sha256 arm:   "e6080ccaf4de08e785ba2ecf6212b65f7c709c53e3ba1844be77eef238b42081",
         intel: "e0315377f127d5927b95126027acd4826ed9a507d1a75f3e422665f75066ebaf"

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
