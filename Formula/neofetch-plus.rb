# typed: false
# frozen_string_literal: true

class NeofetchPlus < Formula
  desc "Fast, highly customisable system info script based on neofetch"
  homepage "https://github.com/LanikSJ/neofetch"
  url "https://github.com/LanikSJ/neofetch/archive/refs/tags/7.3.1.tar.gz"
  sha256 "3684df361c06c742c8f0b78c7b9f4802287bf27bdc4aed89106e131e731c6b47"
  license "MIT"
  head "https://github.com/LanikSJ/neofetch.git", branch: "master"

  on_macos do
    depends_on "screenresolution"
  end

  conflicts_with formula: "neofetch"

  def install
    inreplace "neofetch", "/usr/local", HOMEBREW_PREFIX
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "#{bin}/neofetch", "--config", "none", "--color_blocks", "off",
      "--disable", "wm", "de", "term", "gpu"
  end
end
