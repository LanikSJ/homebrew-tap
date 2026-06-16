#!/usr/bin/env ruby
# frozen_string_literal: true

require "abstract_command"

# This script provides a simple sync operation for Homebrew.
# It updates Homebrew and upgrades installed formulae.
# Supports a `--dry-run` flag to show what would be executed without making changes.

module Homebrew
  module Cmd
    class Sync < AbstractCommand
      cmd_args do
        description <<~EOS
          Perform a Homebrew sync: update, upgrade, cleanup, and update casks.
        EOS
        switch "--dry-run",
               description: "Show what would be executed without making changes."
      end

      def run
        if args.dry_run?
          puts "dry-run: brew update && brew upgrade"
        else
          system "brew update --auto-update && brew upgrade -y && brew cu -ay --include-mas --cleanup && brew cleanup -s --prune=1"
        end
      end
    end
  end
end