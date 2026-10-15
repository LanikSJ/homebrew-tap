class FopRs < Formula
  desc "Rust-based filter list optimizer for AdBlockers"
  homepage "https://github.com/ryanbr/fop-rs"

  version = "6.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ryanbr/fop-rs/releases/download/v#{version}/fop-#{version}-macos-arm64"
      sha256 "2d42367d75535009fad797b9379964dddb34e1155893a016a615ccbd4934e691"
    else
      url "https://github.com/ryanbr/fop-rs/releases/download/v#{version}/fop-#{version}-macos-x86_64"
      sha256 "4a2e5c52c70eb3b5fd18eef93fed8505183db891065b69af2dae15afab889d07"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ryanbr/fop-rs/releases/download/v#{version}/fop-#{version}-linux-arm64"
      sha256 "790538ca7615c61823a3a247aa47bf80840eafa1049b84b0f01502194bc3a1c5"
    else
      url "https://github.com/ryanbr/fop-rs/releases/download/v#{version}/fop-#{version}-linux-x86_64"
      sha256 "da060592a962696ef3f6a6f7cbb531613913cd9f13afcb7570bf98a00754250f"
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
