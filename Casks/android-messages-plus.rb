cask "android-messages-plus" do
  version "6.0.2"
  sha256 "9fd1c3710d213933d3cf8f1501f98bcfcb9899473a55a9673448d7179023db81"

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
  depends_on macos: ">= :monterey"

  app "Android Messages.app"

  zap trash: "~/Library/Application Support/android-messages-desktop"
end
