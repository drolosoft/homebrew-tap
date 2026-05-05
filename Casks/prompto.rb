cask "prompto" do
  version "1.1.0"
  sha256 "8e3ad35e6bfaa4a771918af68d9c00fd78a52499dd2106c90f9295c9f7619b2e"

  url "https://github.com/drolosoft/prompto/releases/download/v#{version}/Prompto-v#{version}-macOS.dmg"
  name "Prompto"
  desc "Compose AI prompts with typed variables and dispatch to any LLM"
  homepage "https://drolosoft.com/prompto"

  depends_on macos: ">= :monterey"

  app "PromptManager.app"

  zap trash: [
    "~/Library/Application Support/PromptManager",
    "~/Library/Preferences/com.drolosoft.prompto.plist",
    "~/Library/Caches/com.drolosoft.prompto",
  ]
end
