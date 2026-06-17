# Maintainer Notes

## Packaging Model

This tap is cask-first.

The upstream project only needs to publish a source tag. This tap builds the macOS artifact from that tag with GitHub Actions, then Homebrew Cask installs the generated `.app` bundle into `/Applications`.

```text
AlxCzl/graphtropy tag
  -> tap workflow on macOS
  -> cargo bundle --release
  -> Graphtropy-<version>-macos.zip
  -> Casks/graphtropy.rb
  -> /Applications/Graphtropy.app
```

Do not use a formula for the default install path. A formula can build from source, but it should install under the Homebrew prefix, not copy directly into `/Applications`.

## Current Stable Release

```text
version: 1.0.0
upstream_ref: v1.0.0
upstream_commit: 92ebcacbb0a7dbde4ccb7a244ee2ae129d7d32b0
```

## Release Procedure

After upstream has published a tag, push the same tag to this tap:

```bash
git fetch --tags origin
git tag v1.0.0
git push origin v1.0.0
```

The tag push triggers the `Package macOS app` workflow automatically.

The workflow:

- checks out this tap;
- checks out the upstream source tag matching the tap tag;
- installs Rust and `cargo-bundle`;
- runs `cargo bundle --release`;
- packages `Graphtropy.app` as `Graphtropy-<version>-macos.zip`;
- computes the SHA-256;
- updates `Casks/graphtropy.rb`;
- commits the checksum update;
- publishes a release in this tap with the zip and `SHA256SUMS`.

After the workflow has completed, test locally:

```bash
brew update
brew install --cask graphtropy
brew uninstall --cask graphtropy
```

The initial cask checksum is intentionally a placeholder. Do not publish the tap as ready for install until the workflow has committed the real SHA-256.

The workflow can still be run manually from GitHub Actions with:

```text
version: 1.0.0
upstream_ref: v1.0.0
upstream_repository: AlxCzl/graphtropy
```
