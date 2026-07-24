cask "quicklook-config" do
  version "0.1.1"
  sha256 "9d03c4f839a4e3a5ecc1f5bd30fc19bbea9bebbd46134cd30750ae4e61d5dc53"

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
