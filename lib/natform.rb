# The root file for the Natform.
# @author Nat Welch (nat@natwelch.com)

# Base requires
require "rubygems"
require "bundler"
Bundler.require

# Application requires. If you create a new class, put it here brosef!
require "natform/game_window"
require "natform/player"
require "natform/ground"

# This defines the Z-Order for everything. Lower numbers mean farther in the
# background of things.
module ZOrder
  Background, Ground, Player, UI = *0..3
end
