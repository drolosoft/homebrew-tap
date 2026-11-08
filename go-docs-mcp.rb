# typed: strict
# frozen_string_literal: true

# Installs the release binary of go-docs-mcp from GitHub. The server calls
# poppler, tesseract and pandoc at run time, so they come as dependencies.
class GoDocsMcp < Formula
  desc "MCP server that serves local documents (PDF, Office, EPUB, text, images) to LLMs"
  homepage "https://github.com/drolosoft/go-docs-mcp"
  version "1.4.0"
  license "MIT"

  depends_on "pandoc"
  depends_on "poppler"
  depends_on "tesseract"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/drolosoft/go-docs-mcp/releases/download/v1.4.0/go-docs-mcp_1.4.0_darwin_arm64.tar.gz"
      sha256 "d6909d42919714f0179f472f09dc9e5e00cf74d26b0207e0d213768d03e70dc1"
    else
      url "https://github.com/drolosoft/go-docs-mcp/releases/download/v1.4.0/go-docs-mcp_1.4.0_darwin_amd64.tar.gz"
      sha256 "c6fa77818e985244f83d7f29fa5aaa8954d17d8422b3c1f0ee6986f6e89b209c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/drolosoft/go-docs-mcp/releases/download/v1.4.0/go-docs-mcp_1.4.0_linux_arm64.tar.gz"
      sha256 "412b15a88a929bc7ad098af01de084c98f0c03503852c433095d9943fc685cad"
    else
      url "https://github.com/drolosoft/go-docs-mcp/releases/download/v1.4.0/go-docs-mcp_1.4.0_linux_amd64.tar.gz"
      sha256 "5cc50ab9c6f9df2a336be4a151ec4f67bee2b3bb7ab8f2d375000f868a46575e"
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
    assert_match '"version":"1.4.0"', output
  end
end
