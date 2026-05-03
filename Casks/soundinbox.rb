cask "soundinbox" do
  version "1.2.2"
  sha256 "00240e8325d85e88f943f0f0f04ada7dfc5a870d0663169de1077fd973736f66"

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
