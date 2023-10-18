class LsusbPlus < Formula
  desc "Utility to display USB bus info"
  homepage "https://github.com/LanikSJ/lsusb"
  url "https://github.com/LanikSJ/lsusb/archive/refs/tags/1.0.2.tar.gz"
  sha256 "972c188ec35dc8fb22639fe14a99dcfc3bd2df4db5e091fa7ac4a794a423cd13"
  license "MIT"
  head "https://github.com/LanikSJ/lsusb", using: :git

  def install
    bin.install "lsusb"
    man8.install "man/lsusb.8"
  end
end
