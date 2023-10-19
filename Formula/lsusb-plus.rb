class LsusbPlus < Formula
  desc "List USB devices, just like the Linux lsusb command"
  homepage "https://github.com/LanikSJ/lsusb"
  url "https://github.com/LanikSJ/lsusb/archive/refs/tags/1.0.3.tar.gz"
  sha256 "af840036a710d7f166d7ee3c9b17e24f695c6a6f5eeb386671a58759fc57d2b0"
  license "MIT"
  head "https://github.com/LanikSJ/lsusb", using: :git

  def install
    bin.install "lsusb"
    man8.install "man/lsusb.8"
  end
end
