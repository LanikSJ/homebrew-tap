# typed: false
# frozen_string_literal: true

class NeofetchPlus < Formula
  desc "Fast, highly customisable system info script based on neofetch"
  homepage "https://github.com/LanikSJ/neofetch"
  url "https://github.com/LanikSJ/neofetch/archive/refs/tags/7.2.0.tar.gz"
  sha256 "caa926c7f8ec1ad30dcf17780780165f541fe3171f448347d777c120c9dd108b"
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
