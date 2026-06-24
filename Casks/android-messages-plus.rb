cask "android-messages-plus" do
  version "6.0.3"
  sha256 "4adc8b8af8f6a14cbb9c2b1e4f167d325d3712053317adb23310a0957aa6074f"

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
