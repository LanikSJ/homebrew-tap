class FopRs < Formula
  desc "Rust-based filter list optimizer for AdBlockers"
  homepage "https://github.com/ryanbr/fop-rs"

  version = "6.1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ryanbr/fop-rs/releases/download/v#{version}/fop-#{version}-macos-arm64"
      sha256 "162a06c8009fe89607dce30a6ec077abf70533295e27f5b8ba9b2969a1f8b489"
    else
      url "https://github.com/ryanbr/fop-rs/releases/download/v#{version}/fop-#{version}-macos-x86_64"
      sha256 "2b2481f02d284c122f32dac8a939c35f2080494ebfeab392c22b126016eb34d2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ryanbr/fop-rs/releases/download/v#{version}/fop-#{version}-linux-arm64"
      sha256 "9e11c1b267dae6a2da17404b2e859481602577e949caf90d12e38d51cba6777f"
    else
      url "https://github.com/ryanbr/fop-rs/releases/download/v#{version}/fop-#{version}-linux-x86_64"
      sha256 "7c7c481b6c75084213a5d60f8c354741aa597a349c5066f09f6d7e46df58fa85"
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
