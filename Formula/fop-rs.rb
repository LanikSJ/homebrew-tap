class FopRs < Formula
  desc "Filter Orderer and Preener - Fast, Rust-based filter list optimizer for ad blockers"
  homepage "https://github.com/ryanbr/fop-rs"
  url "https://github.com/ryanbr/fop-rs/releases/download/v5.0.2/fop-5.0.2-macos-x86_64"
  sha256 "7bbc26418a5e4f54381c9e7a88d9c30e07b782952419f2084bfb33f17c2cce25"
  version "5.0.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ryanbr/fop-rs/releases/download/v5.0.2/fop-5.0.2-macos-arm64"
      sha256 "7bc2207d09d4e30a305d581ef82737b4b181029635061a8878005c17e6fbc720"
    end
  end

  def install
    # The binary is named based on the URL, so we need to rename it
    bin.install "fop-#{version}-macos-#{Hardware::CPU.arch}"
    bin.install_symlink "fop-#{version}-macos-#{Hardware::CPU.arch}" => "fop"
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