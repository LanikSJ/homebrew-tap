cask "android-messages-plus" do
  version "5.4.5"
  sha256 "cea29854bcfec23936a3de4a22f2e9ed168fb5e9b1534661ca7e490294261753"

  url "https://github.com/LanikSJ/android-messages-desktop/releases/download/#{version}/Android-Messages-v#{version}-mac-universal.zip"
  name "Android Messages Desktop"
  desc "Desktop Client for Android Messages"
  homepage "https://github.com/LanikSJ/android-messages-desktop"

  livecheck do
    url :url
    strategy :github_latest
  end

  conflicts_with cask: [
    "android-messages",
    "orangedrangon-android-messages",
  ]
  depends_on macos: ">= :high_sierra"

  app "Android Messages.app"

  zap trash: "~/Library/Application Support/android-messages-desktop"
end
