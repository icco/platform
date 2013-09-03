# A player instance

class Player < Chingu::GameObject
  trait :bounding_box, :scale => 0.8, :debug => false
  traits :timer, :collision_detection , :velocity
  trait :asynchronous

  attr_reader :jumping
  attr_accessor :active

  def inspect
    return "#<Player ##{self.which} @y=#{@y}, @x=#{@x}, @active=#{@active}>"
  end

  def setup
    self.input = {
      [:holding_left, :holding_a] => :holding_left,
      [:holding_right, :holding_d] => :holding_right,
      [:space, :w] => :jump,
      [:s] => :clone,
      [:k] => :die,
      [:q] => :record,
      [:e] => :stop_record,
    }

    @width = @height = 50
    @standing, @walk1, @walk2, @jump = *Image.load_tiles($window, "media/player2.png", @width, @height, false)
    @image = @standing

    @speed = 5
    @jumping = false

    @active = true

    self.zorder = 300
    self.factor = 0.8
    self.acceleration_y = 0.2
    self.max_velocity = 20
    self.rotation_center = :bottom_center

    update
    cache_bounding_box
  end

  def which
    return Player.all.index self
  end

  def holding_left
    @dir = :left
    move(-@speed, 0) if @active
  end

  def holding_right
    @dir = :right
    move(@speed, 0) if @active
  end

  def draw
    self.factor_x = @dir == :left ? -1 : 1 if @active
    super
  end

  def jump
    if @active
      return if @jumping
      Sound["media/jump.wav"].play
      @jumping = true
      self.velocity_y = -10
      @image = @jump
    end
  end

  def clone
    if @active
      new = Player.create({:x => @x, :y => @y})
      new.active = false
    end
  end

  def move(x,y)
    self.x += x
    self.each_collision(Block, GrassBlock) do |me, stone_wall|
      self.x = previous_x
      break
    end

    self.y += y
  end

  # We'll use the timer trait and basically constantly record until all is
  # good. We can then use the Async trait to replay what we saved.
  def record
    return if !@active

    every 20, {:name => "rec"} do
      NatForm.log "Record ##{self.which} @x: #{@x} @y: #{@y}"
      Tick.create(:player => self.which, :x => @x, :y => @y)
    end
  end

  def stop_record
    stop_timer("rec")
    NatForm.log "Recorded #{Tick.where(:player => self.which).count} ticks."
  end

  def update
    self.each_collision(Block, GrassBlock) do |me, stone_wall|
      if self.velocity_y < 0  # Hitting the ceiling
        me.y = stone_wall.bb.bottom + me.image.height * self.factor_y
        self.velocity_y = 0
      else  # Land on ground
        @jumping = false
        me.y = stone_wall.bb.top-1
      end
    end

    @image = (Gosu::milliseconds / 175 % 2 == 0) ? @walk1 : @walk2
  end

  def die
    if @active
      self.collidable = false
      @color = Color::RED.dup
      between(1,600) do
        self.velocity_y = 0
        self.scale += 0.2
        self.alpha -= 5
      end.then do
        # TODO: Sound["media/boom.wav"].play
        self.destroy
        Player.all.delete self
      end

    end
  end
end
