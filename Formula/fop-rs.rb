class FopRs < Formula
  desc "Rust-based filter list optimizer for AdBlockers"
  homepage "https://github.com/ryanbr/fop-rs"

  version = "5.5.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ryanbr/fop-rs/releases/download/v#{version}/fop-#{version}-macos-arm64"
      sha256 "9726a5f3dcf8328eec75e998f2f32e9da4368beecdc3f7a6b75aa75c8890e94f"
    else
      url "https://github.com/ryanbr/fop-rs/releases/download/v#{version}/fop-#{version}-macos-x86_64"
      sha256 "2c5b7df40ceffe58ee07e5d9bde573c43da7d506c97e2f40d514e9784b3b0e47"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ryanbr/fop-rs/releases/download/v#{version}/fop-#{version}-linux-arm64"
      sha256 "e042ef831d9817f06175a5f8e2dc19d631e159162d7a02c9caaecabb9b4aecc5"
    else
      url "https://github.com/ryanbr/fop-rs/releases/download/v#{version}/fop-#{version}-linux-x86_64"
      sha256 "61a699b0611fa689ebb74e4997aeda1dbf6acb5b7094cb14679876412aaa2397"
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
