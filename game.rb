require 'gosu'

# https://github.com/jlnr/gosu/wiki/Ruby-Tutorial
# https://github.com/jlnr/gosu/wiki/Basic-Concepts

class GameWindow < Gosu::Window
  def initialize
    super 640, 480, false
    self.caption = "Gosu Tutorial Game"
  end

  def update
  end

  def draw
  end
end

window = GameWindow.new
window.show
