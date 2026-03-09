class FopRs < Formula
  desc "Rust-based filter list optimizer for AdBlockers"
  homepage "https://github.com/ryanbr/fop-rs"
  version "5.0.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ryanbr/fop-rs/releases/download/v#{version}/fop-#{version}-macos-arm64"
      sha256 "01bd077c010707cb75153ae79f7a4eeb96e456cb54740d1f7cd145c43e31fba8"
    else
      url "https://github.com/ryanbr/fop-rs/releases/download/v#{version}/fop-#{version}-macos-x86_64"
      sha256 "bb18e5c7ae857af1ef231427c1958ecb8fe06ba47155328613153df8848eca21"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ryanbr/fop-rs/releases/download/v#{version}/fop-#{version}-linux-arm64"
      sha256 "cc758c760f370e99806f80071e0825c4d6e2acf4589e814d15535fbef99ce206"
    else
      url "https://github.com/ryanbr/fop-rs/releases/download/v#{version}/fop-#{version}-linux-x86_64"
      sha256 "9bb6c6caaf7e680b2d11d83fc5a793fc134d02c0f288d30db85b4cfdd1be5075"
    end
  end

  def install
    # Determine the correct binary name based on platform and architecture
    binary_name = OS.mac? ? "fop-#{version}-macos-#{Hardware::CPU.arch}" : "fop-#{version}-linux-#{Hardware::CPU.arch}"

    # Install the binary
    bin.install binary_name
    bin.install_symlink binary_name => "fop"
    bin.install_symlink "fop" => "fop-rs"
  end

  test do
    # Test that the binary exists and is executable
    assert_path_exists bin/"fop"
    assert_predicate bin/"fop", :executable?

    # Test basic functionality
    output = shell_output("#{bin}/fop --help")
    assert_match "FOP - Filter Orderer and Preener", output
  end
end