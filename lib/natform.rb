# The root file for the Natform.
# @author Nat Welch (nat@natwelch.com)

# Base requires
require "rubygems"
require "bundler"
Bundler.require

# CONSTANTS
CONFIG = {
  :window => {
    :height => 600,
    :width => 1000,
  },
}

# Application requires. If you create a new class, put it here brosef!
require "natform/game_window"
require "natform/player"
require "natform/block"
require "natform/level"
