cask "android-messages-plus" do
  version "6.1.0"
  sha256 "1634e4cfe68387f65512bd3820b4d9627a865edb4b027a98a4cb7f865c41b23f"

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
  depends_on macos: :monterey

  app "Android Messages.app"

  zap trash: "~/Library/Application Support/android-messages-desktop"
end
