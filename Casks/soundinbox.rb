cask "soundinbox" do
  version "1.2.1"
  sha256 "277c2ef4f9a2f4ef46bdc4e98dc73238f362fcc07915bb0f9103656cada19779"

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
