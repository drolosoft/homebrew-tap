cask "soundinbox" do
  version "1.2.5"
  sha256 "6e4cbdd4b635e5e68923cbb5a812bd5b77cf5df13c76e09729cae872a1098ae8"

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
