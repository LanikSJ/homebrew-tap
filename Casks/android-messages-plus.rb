cask "android-messages-plus" do
  version "6.0.1"
  sha256 "3e4f90b23acfbd35b19054fb6eff69c8a4b55e86792ece64f8f0c6bea92badd3"

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
