class Player < Chingu::GameObject
  trait :bounding_box, :scale => 0.8, :debug => false
  traits :collision_detection, :timer, :velocity

  def initialize(options = {})
    super(options.merge(:image => "media/Starfighter.bmp"))

    self.input = {
      [:holding_left, :holding_a] => :move_left,
      [:holding_right, :holding_d] => :move_right,
      [:down, :s] => :down,
      [:up, :w] => :up,
      [:space] => :jump
    }

    @jumps = 0
  end

  def up
    return
  end

  def down
    return
  end

  def move_left
    @x -= 1
  end

  def move_right
    @x += 1
  end

  def jump
    return if @jumps == 1
    @jumps += 1
    self.velocity_y = -11
  end

  def land
    @jumps = 0
  end
end
