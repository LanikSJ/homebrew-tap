# typed: false
# frozen_string_literal: true

cask "android-messages-plus" do
  version "5.4.2"
  sha256 "5f790e8265e1bafc2803e82252de6faa1356585283c766ac762a2d520970a3ea"

  url "https://github.com/LanikSJ/android-messages-desktop/releases/download/#{version}/Android-Messages-v#{version}-mac-universal.zip"
  name "Android Messages"
  desc "Android Messages as a Cross-platform Desktop App"
  homepage "https://github.com/LanikSJ/android-messages-desktop"

  conflicts_with cask: "android-messages,orangedrangon-android-messages"

  app "Android Messages.app"

  zap trash: "~/Library/Application Support/android-messages-desktop"
end
