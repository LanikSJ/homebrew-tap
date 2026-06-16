#!/usr/bin/env ruby
# frozen_string_literal: true

# This script provides the custom Homebrew command `brew count`.
# It simply counts the number of installed formulae/casks.

module Homebrew
  module Cmd
    class Count < AbstractCommand
      cmd_args do
        description <<~EOS
          Count the number of installed packages (formulae and casks).
        EOS
      end

      def run
        count = `brew list | wc -l`.strip.to_i
        puts "You have #{count} packages installed."
      end
    end
  end
end