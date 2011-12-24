
# Base requires
require "rubygems"
require "bundler"
Bundler.require

require "natform/game_window"
require "natform/player"
require "natform/star"

module ZOrder
  Background, Stars, Player, UI = *0..3
end

