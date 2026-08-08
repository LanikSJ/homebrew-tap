class LsusbPlus < Formula
  desc "List USB devices, just like the Linux lsusb command"
  homepage "https://github.com/LanikSJ/lsusb"
  url "https://github.com/LanikSJ/lsusb/archive/refs/tags/1.1.9.tar.gz"
  sha256 "fb2ea35ff7e3ba06df0f63e65b19034958ad71b74a229eeff7674704ef1ad5bc"
  license "MIT"
  head "https://github.com/LanikSJ/lsusb.git", branch: "main"

  depends_on :macos

  conflicts_with "lsusb", because: "both provide an `lsusb` binary"
  conflicts_with "lsusb-laniksj", because: "both provide an `lsusb` binary"
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
