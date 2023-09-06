# typed: false
# frozen_string_literal: true

class NeofetchPlus < Formula
  desc "Fast, highly customisable system info script based on neofetch"
  homepage "https://github.com/LanikSJ/neofetch"
  url "https://github.com/LanikSJ/neofetch/archive/refs/tags/7.2.6.tar.gz"
  sha256 "9a0faae5219b002bf08b722753276f3f19a3a41d0bce53be2ec6f1fa667b8b6c"
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
