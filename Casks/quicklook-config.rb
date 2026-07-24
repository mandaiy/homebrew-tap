cask "quicklook-config" do
  version "0.1.0"
  sha256 "7dfc7645ac44e70a4a934f344e799f1735176b8baa123279e526720aa0ffa38c"

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
