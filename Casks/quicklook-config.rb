cask "quicklook-config" do
  version "0.1.2"
  sha256 "2b606054fd54dbbf573edfd82e883da92eb05c961e6fddbabbbfac7e2a0cfecf"

  url "https://github.com/mandaiy/quicklook-config/releases/download/v#{version}/QuickLookConfig.zip"
  name "QuickLook Config"
  desc "Quick Look preview extension for YAML / JSON / TOML files"
  homepage "https://github.com/mandaiy/quicklook-config"

  depends_on macos: :ventura

  app "QuickLookConfig.app"

  caveats <<~EOS
    Launch QuickLookConfig.app once so macOS registers the Quick Look extension:
      open "#{appdir}/QuickLookConfig.app"

    The app is ad-hoc signed, so Gatekeeper may block the first launch.
    If it does, remove the quarantine attribute and open it again:
      xattr -dr com.apple.quarantine "#{appdir}/QuickLookConfig.app"

    You can verify the extension registration with:
      qlmanage -m plugins
  EOS
end
