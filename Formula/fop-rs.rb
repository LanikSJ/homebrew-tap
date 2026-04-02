class FopRs < Formula
  desc "Rust-based filter list optimizer for AdBlockers"
  homepage "https://github.com/ryanbr/fop-rs"
  version "5.3.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ryanbr/fop-rs/releases/download/v#{version}/fop-#{version}-macos-arm64"
      sha256 "9cdce2b3463f4b81bd13558b3e166a8f1becac41556d8622a5746b4e7278cd45"
    else
      url "https://github.com/ryanbr/fop-rs/releases/download/v#{version}/fop-#{version}-macos-x86_64"
      sha256 "2dc9fd1727b8472986f33625028c318a24f33f6b8582c7a934d4fc2f9fcac313"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ryanbr/fop-rs/releases/download/v#{version}/fop-#{version}-linux-arm64"
      sha256 "bdefcf52b48cd98439d6d0995696d4673627ef58ce608be60121ec3b8a18d380"
    else
      url "https://github.com/ryanbr/fop-rs/releases/download/v#{version}/fop-#{version}-linux-x86_64"
      sha256 "ed3269663c14e91c388bb64138810f07f029ab01518c843f15d8c4c3f46940f3"
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
