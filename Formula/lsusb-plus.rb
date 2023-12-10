class LsusbPlus < Formula
  desc "List USB devices, just like the Linux lsusb command"
  homepage "https://github.com/LanikSJ/lsusb"
  url "https://github.com/LanikSJ/lsusb/archive/refs/tags/1.1.2.tar.gz"
  sha256 "55505e6f7be005ba2fa0e57eb29c3dd400d0a87549b009ebd6bf1bce518c0cce"
  license "MIT"
  head "https://github.com/LanikSJ/lsusb.git", branch: "main"

  depends_on :macos

  conflicts_with "lsusb", because: "both provide an `lsusb` binary"
  conflicts_with "usbutils", because: "both provide an `lsusb` binary"

  def install
    bin.install "lsusb"
    man8.install "man/lsusb.8"
  end

  test do
    output = shell_output("#{bin}/lsusb")
    assert_match(/^Bus [0-9]+ Device [0-9]+:/, output)
  end
end
