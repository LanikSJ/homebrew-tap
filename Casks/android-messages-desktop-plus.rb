# typed: false
# frozen_string_literal: true

cask "android-messages-desktop-plus" do
  version "5.4.1"
  sha256 :no_check

  url "https://github.com/LanikSJ/android-messages-desktop/releases/download/#{version}/Android-Messages-v#{version}-mac-universal.zip"
  name "Android Messages"
  desc "Android Messages as a Cross-platform Desktop App"
  homepage "https://github.com/LanikSJ/android-messages-desktop"

  depends_on arch: :intel
  depends_on arch: :arm64

  app "Android Messages.app"

  uninstall trash: [
    "~/Library/Application\ Support/Android\ Messages",
    "~/Library/Preferences/pw.kmr.amd.plist",
    "~/Library/Saved\ Application\ State/pw.kmr.amd.savedState"
  ]
end