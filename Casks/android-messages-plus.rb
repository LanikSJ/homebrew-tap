cask "android-messages-plus" do
  version "5.4.4"
  sha256 "ae3489e9db130613be9740239d98865996fe52ce7962e2b8655d54431facac47"

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
