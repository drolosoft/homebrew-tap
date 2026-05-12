cask "soundinbox" do
  version "1.2.7"
  sha256 "189b78c04366281439cb8eb604fe00f46b921cf9ece86106755beb684f8d427b"

  url "https://github.com/drolosoft/soundinbox/releases/download/v#{version}/SoundInbox-v#{version}-macOS.dmg"
  name "SoundInbox"
  desc "Turn important emails into unmistakable sounds"
  homepage "https://drolosoft.com/soundinbox"

  depends_on macos: ">= :sonoma"

  app "SoundInbox.app"

  zap trash: [
    "~/Library/Application Support/SoundInbox",
    "~/Library/Preferences/com.drolosoft.soundinbox.plist",
    "~/Library/Caches/com.drolosoft.soundinbox",
  ]
end
