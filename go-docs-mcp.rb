# typed: strict
# frozen_string_literal: true

# Installs the release binary of go-docs-mcp from GitHub. The server calls
# poppler, tesseract and pandoc at run time, so they come as dependencies.
class GoDocsMcp < Formula
  desc "MCP server that serves local documents (PDF, Office, EPUB, text, images) to LLMs"
  homepage "https://github.com/drolosoft/go-docs-mcp"
  version "1.4.1"
  license "MIT"

  depends_on "pandoc"
  depends_on "poppler"
  depends_on "tesseract"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/drolosoft/go-docs-mcp/releases/download/v1.4.1/go-docs-mcp_1.4.1_darwin_arm64.tar.gz"
      sha256 "5b96f93122ca63be52da493952c49845e9f05f1969ffe8e9e206cd9abacb7551"
    else
      url "https://github.com/drolosoft/go-docs-mcp/releases/download/v1.4.1/go-docs-mcp_1.4.1_darwin_amd64.tar.gz"
      sha256 "f0d9094337ed2a46c4e2bad17499e439f8c57b250368e228e59a0a35918bdc51"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/drolosoft/go-docs-mcp/releases/download/v1.4.1/go-docs-mcp_1.4.1_linux_arm64.tar.gz"
      sha256 "a271e938fa8de6093e5f5c18c3a0a638f858472feef33d1f1cf1996cd5702a77"
    else
      url "https://github.com/drolosoft/go-docs-mcp/releases/download/v1.4.1/go-docs-mcp_1.4.1_linux_amd64.tar.gz"
      sha256 "e9c1ba78eb116a2277261b0ed1daae9212eb1a862a6d2a22f4387ddc0c149d02"
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
    assert_match '"version":"1.4.1"', output
  end
end
