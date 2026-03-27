# This formula is auto-updated by GoReleaser on each release.
# Manual edits will be overwritten.
class CmuxResurrect < Formula
  desc "Session persistence for cmux — save, restore, and manage your terminal workspaces"
  homepage "https://github.com/drolosoft/cmux-resurrect"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/drolosoft/cmux-resurrect/releases/latest/download/cmux-resurrect_darwin_arm64.tar.gz"
    end
    on_intel do
      url "https://github.com/drolosoft/cmux-resurrect/releases/latest/download/cmux-resurrect_darwin_amd64.tar.gz"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/drolosoft/cmux-resurrect/releases/latest/download/cmux-resurrect_linux_arm64.tar.gz"
    end
    on_intel do
      url "https://github.com/drolosoft/cmux-resurrect/releases/latest/download/cmux-resurrect_linux_amd64.tar.gz"
    end
  end

  def install
    bin.install "crex"
  end

  test do
    system "#{bin}/crex", "version"
  end
end
