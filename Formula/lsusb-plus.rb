class LsusbPlus < Formula
  desc "List USB devices, just like the Linux lsusb command"
  homepage "https://github.com/LanikSJ/lsusb"
  url "https://github.com/LanikSJ/lsusb/archive/refs/tags/1.1.1.tar.gz"
  sha256 "8d3a57cb8387ad53b146119c7863fea86a8312153e1256b6e6e83366b454bbc6"
  license "MIT"
  head "https://github.com/LanikSJ/lsusb", using: :git

  def install
    bin.install "lsusb"
    man8.install "man/lsusb.8"
  end
end
