cask "soundinbox" do
  version "1.2.8"
  sha256 "099fbbe119db736e0957c0f1645b62ced2d6c32130b46e3f7116820ea80fdc47"

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

