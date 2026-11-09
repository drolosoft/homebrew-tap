# typed: strict
# frozen_string_literal: true

# Installs the release binary of go-docs-mcp from GitHub. The server calls
# poppler, tesseract and pandoc at run time, so they come as dependencies.
class GoDocsMcp < Formula
  desc "MCP server that serves local documents (PDF, Office, EPUB, text, images) to LLMs"
  homepage "https://github.com/drolosoft/go-docs-mcp"
  version "1.5.0"
  license "MIT"

  depends_on "pandoc"
  depends_on "poppler"
  depends_on "tesseract"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/drolosoft/go-docs-mcp/releases/download/v1.5.0/go-docs-mcp_1.5.0_darwin_arm64.tar.gz"
      sha256 "a70b63d1ccd49dfda33cebc12bf5d3ee7ae04c4202df09dc5ff861bd0e8d3843"
    else
      url "https://github.com/drolosoft/go-docs-mcp/releases/download/v1.5.0/go-docs-mcp_1.5.0_darwin_amd64.tar.gz"
      sha256 "df09f27492ef5bcda5c80ba952fb313a145fb46cda338d5c4948a2ef6f85f74b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/drolosoft/go-docs-mcp/releases/download/v1.5.0/go-docs-mcp_1.5.0_linux_arm64.tar.gz"
      sha256 "d7072c342da3e68bbdc1d41f93ae8c95e854dc596b448ec1255907966dc45aee"
    else
      url "https://github.com/drolosoft/go-docs-mcp/releases/download/v1.5.0/go-docs-mcp_1.5.0_linux_amd64.tar.gz"
      sha256 "6236a3c577d0e21f9805efa3d8de6d41c695d229bcaab3e216b76c7a722f3136"
    end
  end

  def install
    bin.install "go-docs-mcp"
  end

  # The binary has no --version flag: it speaks MCP over stdio, so the test
  # sends an initialize request and checks the server name and version.
  test do
    request = <<~JSON
      {"jsonrpc":"2.0","id":1,"method":"initialize",
       "params":{"protocolVersion":"2025-03-26","capabilities":{},
                 "clientInfo":{"name":"brew","version":"0"}}}
    JSON
    output = pipe_output("#{bin}/go-docs-mcp", "#{request.delete("\n")}\n", 0)
    assert_match '"name":"go-docs-mcp"', output
    assert_match '"version":"1.5.0"', output
  end
end
