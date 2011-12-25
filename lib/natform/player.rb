class Player < Chingu::GameObject
  attr_reader :score
  def initialize(options = {})
    super(options.merge(:image => "media/Starfighter.bmp"))

    self.input = {
      :holding_left => :move_left,
      :holding_right => :move_right
    }
  end

  def move_left
    @x -= 1
  end

  def move_right
    @x += 1
  end
end
