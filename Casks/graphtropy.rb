cask "graphtropy" do
  version "1.0.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/sagittarius-a/homebrew-graphtropy/releases/download/v#{version}/Graphtropy-#{version}-macos.zip",
      verified: "github.com/sagittarius-a/homebrew-graphtropy/"
  name "Graphtropy"
  desc "Interactive binary entropy visualizer with hex viewer and PNG exporter"
  homepage "https://github.com/AlxCzl/graphtropy"

  depends_on macos: :ventura

  app "Graphtropy.app"
end
