cask "byre" do
  arch arm: "apple-silicon", intel: "intel"

  version "0.4.1"
  sha256 arm:   "2341270cc5f9fd39a270953504fd1e7358f35de206edc2b039fd4eb91e1a8d0a",
         intel: "ecd5055454f27e36064caa102e978b84dc1f132cf7484587218bb3cab1321601"

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
