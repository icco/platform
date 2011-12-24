class GameWindow < Gosu::Window
  def initialize
    super(800, 600, false)
    self.caption = "Natform (sadnat.com/game)"

    @player = Player.new(self)

    # Sets player at center of screen.
    @player.warp(400, 300)

    @font = Gosu::Font.new(self, Gosu::default_font_name, 20)
  end

  def update
    if button_down? Gosu::KbLeft or button_down? Gosu::GpLeft then
      @player.turn_left
    end

    if button_down? Gosu::KbRight or button_down? Gosu::GpRight then
      @player.turn_right
    end

    if button_down? Gosu::KbUp or button_down? Gosu::GpButton0 then
      @player.accelerate
    end

    @player.move
  end

  def draw
    @player.draw
    @font.draw("Score: #{@player.score}", 10, 10, ZOrder::UI, 1.0, 1.0, 0xffffff00)
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end
end
