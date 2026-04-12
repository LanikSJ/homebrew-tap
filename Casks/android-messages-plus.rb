cask "android-messages-plus" do
  version "6.0.0"
  sha256 "d81c3606bf468bd3843e30a2474b48e8c4d1941f8730abb80c46e8a3e5b776be"

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
