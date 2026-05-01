class FopRs < Formula
  desc "Rust-based filter list optimizer for AdBlockers"
  homepage "https://github.com/ryanbr/fop-rs"
  version "5.3.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ryanbr/fop-rs/releases/download/v#{version}/fop-#{version}-macos-arm64"
      sha256 "62e43cccf3be6510b71bb3f179d07f2361293e5a10b7d7a606c659047240e999"
    else
      url "https://github.com/ryanbr/fop-rs/releases/download/v#{version}/fop-#{version}-macos-x86_64"
      sha256 "bd2a60deb7c142e3f54deba58747d5df3007a422f442dcde2d294e138ee6bd2e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ryanbr/fop-rs/releases/download/v#{version}/fop-#{version}-linux-arm64"
      sha256 "a1152ba15f1661ab9a5f03574180052f48fb293528c7387be214ce5b983c0373"
    else
      url "https://github.com/ryanbr/fop-rs/releases/download/v#{version}/fop-#{version}-linux-x86_64"
      sha256 "631b5c93674be22fcdd38292a5a3c72786901781c41876747bc5ebbea5277cc0"
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
