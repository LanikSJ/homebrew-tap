class FopRs < Formula
  desc "Filter Orderer and Preener - Fast, Rust-based filter list optimizer for ad blockers"
  homepage "https://github.com/ryanbr/fop-rs"
  version "5.0.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ryanbr/fop-rs/releases/download/v#{version}/fop-#{version}-macos-arm64"
      sha256 "7bc2207d09d4e30a305d581ef82737b4b181029635061a8878005c17e6fbc720"
    else
      url "https://github.com/ryanbr/fop-rs/releases/download/v#{version}/fop-#{version}-macos-x86_64"
      sha256 "7bbc26418a5e4f54381c9e7a88d9c30e07b782952419f2084bfb33f17c2cce25"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ryanbr/fop-rs/releases/download/v#{version}/fop-#{version}-linux-arm64"
      sha256 "1a6d059229853908fae3223d7d57d64c2e7a8f71629cbe7f5ee2916f54db7f8c"
    else
      url "https://github.com/ryanbr/fop-rs/releases/download/v#{version}/fop-#{version}-linux-x86_64"
      sha256 "60a95d961f83863127ffaad4eb915b6ef4431a181d686a40d43cb742b7cc4844"
    end
  end

  def install
    # Determine the correct binary name based on platform and architecture
    if OS.mac?
      binary_name = "fop-#{version}-macos-#{Hardware::CPU.arch}"
    else
      binary_name = "fop-#{version}-linux-#{Hardware::CPU.arch}"
    end
    
    # Install the binary
    bin.install binary_name
    bin.install_symlink binary_name => "fop"
    bin.install_symlink "fop" => "fop-rs"
  end

  test do
    # Test that the binary exists and is executable
    assert_predicate bin/"fop", :exist?
    assert_predicate bin/"fop", :executable?
    
    # Test basic functionality
    output = shell_output("#{bin}/fop --help")
    assert_match "FOP - Filter Orderer and Preener", output
  end
end