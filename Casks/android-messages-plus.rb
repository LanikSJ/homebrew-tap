cask "android-messages-plus" do
  version "5.7.1"
  sha256 "164af4dfcafc24c0b07333ce99255a5a7613ac238fa73d6daa4f9ea3e4e6d114"

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
  depends_on macos: ">= :sonoma"

  app "Android Messages.app"

  zap trash: "~/Library/Application Support/android-messages-desktop"
end
