cask "android-messages-plus" do
  version "6.1.1"
  sha256 "dd019706e8e74ea412420ad4d58af1e6dcd0083e89342c918272ce780aa35c54"

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
  depends_on macos: :ventura

  app "Android Messages.app"

  zap trash: "~/Library/Application Support/android-messages-desktop"
end
