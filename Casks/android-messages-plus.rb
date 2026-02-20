cask "android-messages-plus" do
  version "5.7.1.1"
  sha256 "0dac3d263c17de61a6ed703690bdd7870b20cab59c190b9b187999699c27070e"

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
