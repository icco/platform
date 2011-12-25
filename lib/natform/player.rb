class Player < Chingu::GameObject
  attr_reader :score
  def initialize(options = {})
    super(options.merge(:image => Gosu::Image.autoload("media/Starfighter.bmp")))
  end

  def move_left
    @x -= 1
  end

  def move_right
    @x += 1
  end
end
