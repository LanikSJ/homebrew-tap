class FopRs < Formula
  desc "Rust-based filter list optimizer for AdBlockers"
  homepage "https://github.com/ryanbr/fop-rs"

  version = "6.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ryanbr/fop-rs/releases/download/v#{version}/fop-#{version}-macos-arm64"
      sha256 "3445f980c86da859bb01be680eaeebc0a32125cf026ac5d68121ba61862b8035"
    else
      url "https://github.com/ryanbr/fop-rs/releases/download/v#{version}/fop-#{version}-macos-x86_64"
      sha256 "a9d7c20bb3aa8256a66454ce97aeca3c721f247dbaf6f4388e4eb681e00235fc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ryanbr/fop-rs/releases/download/v#{version}/fop-#{version}-linux-arm64"
      sha256 "f73aaa9dbfe3360d6b8f12acc5c0c73e1fb2d61fd81c826d0be96360296d3497"
    else
      url "https://github.com/ryanbr/fop-rs/releases/download/v#{version}/fop-#{version}-linux-x86_64"
      sha256 "92ec9dd0e8ae0e392079c89d8c099f87b2ece8bab28ba09e3e1b7c2bf7cd2989"
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
