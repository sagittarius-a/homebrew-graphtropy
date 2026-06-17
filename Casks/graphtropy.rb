cask "graphtropy" do
  version "1.0.0"
  sha256 "c94e45c0edad25fc578c4bfa25ea26eef4a6fa0137f6277fc1dcf7e0091312b2"

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
