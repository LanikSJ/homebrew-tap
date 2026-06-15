# LanikSJ Homebrew 🍻 Tap

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/461fc7358cfd415abf338d475d948157)](https://www.codacy.com/gh/LanikSJ/homebrew-tap/dashboard?utm_source=github.com&utm_medium=referral&utm_content=LanikSJ/homebrew-tap&utm_campaign=Badge_Grade)
![GitHub Repo Size](https://img.shields.io/github/repo-size/laniksj/homebrew-tap)
![GitHub Code Size in Bytes](https://img.shields.io/github/languages/code-size/laniksj/homebrew-tap)
![GitHub Last Commit](https://img.shields.io/github/last-commit/laniksj/homebrew-tap)
![GitHub Commit Activity](https://img.shields.io/github/commit-activity/m/laniksj/homebrew-tap)

- [Description](#-description)
- [Casks](#-casks)
- [Formulae](#-formulae)
- [Commands](#-commands)
- [Installation](#-installation)
- [Usage](#-usage)
- [Bugs](#-bugs)
- [License](#-license)
- [Donate](#-donate)

## 📝 Description

This is my Homebrew 🍻 Tap where you'll find my custom Casks, Formulae, and Commands.

## 🍻 Casks

- `android-messages-plus` 👉 [Android Messages](https://github.com/OrangeDrangon/android-messages-desktop) with new
  icons from [#406](https://github.com/OrangeDrangon/android-messages-desktop/pull/406)

## 🍻 Formulae

- `fop-rs` 👉 [fop-rs](https://github.com/ryanbr/fop-rs) - Fast, Rust-based filter list optimizer for ad blockers
- `lsusb-plus` 👉 [lsusb](https://github.com/jlhonora/lsusb) with mods from [jlhonora#23](https://github.com/jlhonora/lsusb/pull/23)

## 🛠 Commands

Custom Homebrew external commands that extend `brew` with additional functionality.

- `brew-count` 👉 Counts the number of installed Homebrew packages (formulae and casks).

  ```bash
  brew count
  ```

- `brew-sync` 👉 Updates Homebrew and upgrades all installed packages with a single command. Supports a `--dry-run` flag to preview changes without applying them.

  ```bash
  brew sync
  brew sync --dry-run
  ```

## 💾 Installation

First, tap the repository:

```bash
brew tap laniksj/tap
```

Then install any cask, formula, or command:

```bash
brew install --cask android-messages-plus
```

```bash
brew install fop-rs
```

```bash
brew install lsusb-plus
```

Commands are automatically available once the tap is installed.

## 🛠 Usage

Once installed, use the commands as you would any other `brew` subcommand:

```bash
# Count installed packages
brew count

# Sync (update & upgrade) with a dry-run preview
brew sync --dry-run

# Sync and apply changes
brew sync
```

## 🐛 Bugs

Please report any bugs or issues you find. Thanks!

## 📝 License

[![MIT License](https://img.shields.io/badge/license-MIT-blue)](https://en.wikipedia.org/wiki/MIT_License)

## 💰 Donate

[![Patreon](https://img.shields.io/badge/patreon-donate-blue.svg)](https://www.patreon.com/laniksj/overview)
