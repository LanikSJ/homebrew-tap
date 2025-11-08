cask "android-messages-plus" do
  version "5.6.0"
  sha256 "a3ded170da456843ac57b1373b6cf1a8741550f1b900e4d216a6ab747e7a8ae4"

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
