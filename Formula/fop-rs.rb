class FopRs < Formula
  desc "Rust-based filter list optimizer for AdBlockers"
  homepage "https://github.com/ryanbr/fop-rs"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ryanbr/fop-rs/releases/download/v5.4.0/fop-5.4.0-macos-arm64"
      sha256 "a64ec55c602f79663dd30c30668818a059669b4605f12b0f84b48a0a33ac5414"
    else
      url "https://github.com/ryanbr/fop-rs/releases/download/v5.4.0/fop-5.4.0-macos-x86_64"
      sha256 "852da02181f605011f793b09766b748e358cedebfb03e495f23f6277112002ff"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ryanbr/fop-rs/releases/download/v5.4.0/fop-5.4.0-linux-arm64"
      sha256 "a4a933e5356572b177e2839f543b5bebe1418bdeea61fd27c2cf39725c8492a6"
    else
      url "https://github.com/ryanbr/fop-rs/releases/download/v5.4.0/fop-5.4.0-linux-x86_64"
      sha256 "cf1c2b5fd6f6207427c21ba012cde053cf4cd7ccd2ac973a44ebd88bc614a002"
    end
  end

  def install
    os = OS.mac? ? "macos" : "linux"
    binary_name = "fop-#{version}-#{os}-#{Hardware::CPU.arch}"
    bin.install binary_name
    bin.install_symlink binary_name => "fop"
    bin.install_symlink "fop" => "fop-rs"
  end

  test do
    assert_path_exists bin/"fop"
    assert_predicate bin/"fop", :executable?
    output = shell_output("#{bin}/fop --help")
    assert_match "FOP - Filter Orderer and Preener", output
  end
end
