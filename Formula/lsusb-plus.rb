class Lsusb < Formula
    desc "A utility for displaying information about USB buses in the system and devices connected to them"
    homepage "https://github.com/LanikSJ/lsusb"
    url "https://github.com/LanikSJ/lsusb/archive/refs/tags/1.0.1.zip"
    sha256 "ac197d054dc685195e1c1fa9c29c8933d04ce4c151bad1ce65fb428a51b3ece7"
    head "https://github.com/LanikSJ/lsusb", using: :git
  
    def install
      bin.install "lsusb"
      man8.install "man/lsusb.8"
    end
  end