# homebrew-graphtropy

Homebrew tap for [graphtropy](https://github.com/AlxCzl/graphtropy).

## Install

```bash
brew tap sagittarius-a/graphtropy
brew install --cask graphtropy
```

This installs `Graphtropy.app` in `/Applications`.

## Gatekeeper

The app bundle is ad-hoc signed by the packaging workflow, but it is not Apple-notarized.

On recent macOS versions, Gatekeeper may show a message such as:

```text
"Graphtropy" is damaged and can't be opened. You should move it to the Bin.
```

This does not mean the Homebrew ZIP checksum failed. It means macOS quarantined an app that is not signed with a Developer ID certificate and notarized by Apple.

Until Graphtropy has Developer ID signing and notarization, users who prefer to bypass Gatekeeper quarantine can install with:

```bash
brew install --cask --no-quarantine graphtropy
```

## Packaging

This tap packages the macOS app from the upstream source tag.

The upstream project only needs to publish a Git tag, for example `v1.0.0`.
Push the same tag to this tap to trigger packaging automatically:

```bash
git tag v1.0.0
git push origin v1.0.0
```

The `Package macOS app` workflow in this tap checks out the matching upstream tag on a macOS runner, runs `cargo bundle --release`, publishes `Graphtropy-<version>-macos.zip`, and updates the cask SHA-256.

The cask then installs that generated app bundle through Homebrew Cask, which is why the app lands in `/Applications`.

Before the first packaging workflow run for a version, the cask checksum is a placeholder. The cask becomes installable after the workflow publishes the zip and commits the real SHA-256.

## Release

1. Wait for the upstream tag to exist, for example `AlxCzl/graphtropy@v1.0.0`.
2. Push the same tag to this tap.
3. Wait for the workflow to publish the tap release and commit the cask checksum update.
4. Test with `brew install --cask graphtropy`.

The workflow can still be run manually from GitHub Actions when packaging a custom upstream ref.
