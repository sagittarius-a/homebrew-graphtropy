cask "graphtropy" do
  version "1.0.0"
  sha256 "7c21074f6b5e2e3c12205473ae9f5fbdefc34d9ce366c326471f65f68c29aad5"

  url "https://github.com/sagittarius-a/homebrew-graphtropy/releases/download/v#{version}/Graphtropy-#{version}-macos.zip",
      verified: "github.com/sagittarius-a/homebrew-graphtropy/"
  name "Graphtropy"
  desc "Interactive binary entropy visualizer with hex viewer and PNG exporter"
  homepage "https://github.com/AlxCzl/graphtropy"

  depends_on macos: :ventura

  app "Graphtropy.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "/Applications/Graphtropy.app"]
  end

  caveats <<~EOS
    Graphtropy is ad-hoc signed, but not Apple-notarized.
  EOS
end
