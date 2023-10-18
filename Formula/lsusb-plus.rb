class LsusbPlus < Formula
  desc "List USB devices, just like the Linux lsusb command"
  homepage "https://github.com/LanikSJ/lsusb"
  url "https://github.com/LanikSJ/lsusb/archive/refs/tags/1.0.1.tar.gz"
  sha256 "ac197d054dc685195e1c1fa9c29c8933d04ce4c151bad1ce65fb428a51b3ece7"
  license "MIT"
  head "https://github.com/LanikSJ/lsusb", using: :git

  def install
    bin.install "lsusb"
    man8.install "man/lsusb.8"
  end
end
