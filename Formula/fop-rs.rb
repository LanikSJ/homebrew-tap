class FopRs < Formula
  desc "Rust-based filter list optimizer for AdBlockers"
  homepage "https://github.com/ryanbr/fop-rs"

  version = "6.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ryanbr/fop-rs/releases/download/v#{version}/fop-#{version}-macos-arm64"
      sha256 "cbad98ae0791c77d368160b3fc9c63189904e2934ee3a9102e9f8bf8fbe73f81"
    else
      url "https://github.com/ryanbr/fop-rs/releases/download/v#{version}/fop-#{version}-macos-x86_64"
      sha256 "3c337739235c84e34ea6a758b49d0ff837f054d249b91da86a869d48d9efb992"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ryanbr/fop-rs/releases/download/v#{version}/fop-#{version}-linux-arm64"
      sha256 "615126ae7edb24c88dd8c6a58a374588df09d86d1789b39ad4121c9406f1e227"
    else
      url "https://github.com/ryanbr/fop-rs/releases/download/v#{version}/fop-#{version}-linux-x86_64"
      sha256 "7c91f9cc6c0b68a8548ebcf99a65582c2f77f7179185f6a7762711f1c044489f"
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
