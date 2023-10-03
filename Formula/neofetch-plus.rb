# typed: false
# frozen_string_literal: true

class NeofetchPlus < Formula
  desc "Fast, highly customisable system info script based on neofetch"
  homepage "https://github.com/LanikSJ/neofetch"
  url "https://github.com/LanikSJ/neofetch/archive/refs/tags/7.2.8.tar.gz"
  sha256 "18f5e6f5e37a06b9e0500571bba03071cb93b430975452faa219a0d0249395db"
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
