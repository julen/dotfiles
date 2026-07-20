#!/usr/bin/env bash

###############################################################################
# macOS Setup
#
# NOTE: requires manually adding the terminal app within
#       Settings > Privacy & Security > Full Disk Access
#
# References:
#   https://macos-defaults.com/
#   https://mths.be/macos
###############################################################################

HOSTNAME="zu"

# ---- Preparation

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# ---- System

sudo scutil --set ComputerName $HOSTNAME
sudo scutil --set HostName $HOSTNAME
sudo scutil --set LocalHostName $HOSTNAME
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $HOSTNAME
sudo defaults write /Library/Preferences/com.apple.loginwindow DesktopPicture ""

# ---- Menu bar

defaults write NSGlobalDomain SLSMenuBarUseBlurredAppearance -int 1

# ---- Dock & Desktop

defaults write com.apple.dock tilesize -int 64
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-time-modifier -float 0.25
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.WindowManager StandardHideWidgets -bool true

# ---- Screenshots

mkdir -p "$HOME/Desktop/screenshots"

defaults write com.apple.screencapture location \
  "$HOME/Desktop/screenshots"

# ---- Finder

defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder FXPreferredViewStyle -string Nlsv
defaults write com.apple.finder _FXSortFoldersFirst -bool true
defaults write com.apple.finder FXDefaultSearchScope -string SCcf
defaults write com.apple.finder _FXEnableColumnAutoSizing -bool true
defaults write com.apple.finder ShowStatusBar -bool true

# ---- Keyboard

defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
defaults write NSGlobalDomain AppleKeyboardUIMode -int 2
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain NSWindowShouldDragOnGesture -bool true
defaults write NSGlobalDomain WebAutomaticTextReplacementEnabled -bool false

# ---- Trackpad

defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true

# ---- Accessibility

defaults write com.apple.universalaccess reduceMotion -int 1
defaults write com.apple.universalaccess reduceTransparency -int 1
defaults write com.apple.Accessibility ReduceMotionEnabled -int 1
defaults write com.apple.Accessibility ReduceTransparencyEnabled -int 1

# ---- Appeareance

defaults write NSGlobalDomain AppleReduceDesktopTinting -bool true

# ---- Raycast

defaults write com.raycast.macos raycastGlobalHotkey -string "Command-49"

# ---- Apply

killall cfprefsd || true
killall Dock || true
killall Finder || true
killall SystemUIServer || true
