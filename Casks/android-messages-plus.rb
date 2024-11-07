cask "android-messages-plus" do
  version "5.5.0"
  sha256 "fa9aad22dfd0b2fef68badc12b4fe0a0f2dc09cc6165a23d748077c03c7d9c2c"

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
