# typed: false
# frozen_string_literal: true

class NeofetchPlus < Formula
  desc "Fast, highly customisable system info script based on neofetch"
  homepage "https://github.com/LanikSJ/neofetch"
  url "https://github.com/LanikSJ/neofetch/archive/refs/tags/7.2.3.tar.gz"
  sha256 "a11608242e732a71b2bd1c9774178783f021b73ed481a0d065c37f25846ef851"
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
