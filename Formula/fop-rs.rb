class FopRs < Formula
  desc "Rust-based filter list optimizer for AdBlockers"
  homepage "https://github.com/ryanbr/fop-rs"
  version "5.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ryanbr/fop-rs/releases/download/v#{version}/fop-#{version}-macos-arm64"
      sha256 "061b0eb5659c39760a6fcb0218a5735a8c1c33dec3e5a18ebaf3bd8551bce669"
    else
      url "https://github.com/ryanbr/fop-rs/releases/download/v#{version}/fop-#{version}-macos-x86_64"
      sha256 "79c85827ddba007fd8dbf63315512c7bf4d07f4ce70bef876340b1c8b75ca831"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ryanbr/fop-rs/releases/download/v#{version}/fop-#{version}-linux-arm64"
      sha256 "bbcb2228d696edd93daad3ab30a47f01b9f24270b7d560a78056002b7df72409"
    else
      url "https://github.com/ryanbr/fop-rs/releases/download/v#{version}/fop-#{version}-linux-x86_64"
      sha256 "eda2b40bb0b35306de0d1d534d6c35ce8353ba8bc056fc23d9876edb294aaa9a"
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
