class FopRs < Formula
  desc "Rust-based filter list optimizer for AdBlockers"
  homepage "https://github.com/ryanbr/fop-rs"
  version "5.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ryanbr/fop-rs/releases/download/v#{version}/fop-#{version}-macos-arm64"
      sha256 "1674f822c5ec46a572fa6db44dc7f977246e99e01930ab19ca7650504d8af576"
    else
      url "https://github.com/ryanbr/fop-rs/releases/download/v#{version}/fop-#{version}-macos-x86_64"
      sha256 "4051022f1ff23a33b6826c31812dc672ccf6f34cab4b891712b9b088a5b4a8a5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ryanbr/fop-rs/releases/download/v#{version}/fop-#{version}-linux-arm64"
      sha256 "70d6d52ed2b3d490430d003bc54afb65e0832c6255d201c1c78f0dfd9fc7d12e"
    else
      url "https://github.com/ryanbr/fop-rs/releases/download/v#{version}/fop-#{version}-linux-x86_64"
      sha256 "925b4afcecc4004de55fc6bfb5dea4dfb6a09ff410077bd12362964b4cfe3ea3"
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
