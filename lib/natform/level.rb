# Base Level class

class Level < Chingu::GameState
  traits :viewport, :timer

  def initialize(options = {})
    super options

    $window.caption = "Sad Nat. (#{self.class})"

    self.viewport.game_area = [0, 0, 3500, 2000]

    @tile_width = @tile_height = 60
    @tileset = Gosu::Image.load_tiles($window, "media/tileset.png", @tile_width, @tile_height, true)

    @player = Player.create(:x => 100, :y => 400)

    @clone_text = Text.create("Clones: #{Player.all.count}", :x => 10, :y => 10, :zorder => 550, :size => 20, :color => Color::WHITE)

    self.input = {
      :escape => :exit,
    }

    # An attempt at map building.
    lines = File.readlines(@level_map).map { |line| line.chomp }
    @height = lines.size
    @width = lines[0].size
    @tiles = Array.new(@width) do |x|
      Array.new(@height) do |y|
        case lines[y][x, 1]
        when '&'
          GrassBlock.create({:x => x*50, :y => y*50})
        when '#'
          Block.create({:x => x*50, :y => y*50})
        when '!'
          ExitBlock.create({:x => x*50, :y => y*50})
        else
          nil # Do Nothing!
        end
      end
    end
  end

  def update
    super

    self.viewport.center_around(@player)

    @clone_text.text = "Clones: #{Player.all.count}\nFPS: #{$window.fps}"
    @clone_text.x = self.viewport.x + 10
    @clone_text.y = self.viewport.y + 10
  end
end
