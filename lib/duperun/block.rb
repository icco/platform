# Map class holds and draws tiles
class Block < Chingu::GameObject
  trait :bounding_box, :debug => false
  trait :collision_detection

  def self.solid
    all.select { |block| block.alpha == 255 }
  end

  def self.inside_viewport
    all.select { |block| block.game_state.viewport.inside?(block) }
  end

  def setup
    @width = @height = 60
    @grass, @dirt = *Image.load_tiles($window, "media/tileset.png", @width, @height, false)
    @image = @dirt
    @color = Color.new(0xff808080)
    cache_bounding_box
  end
end
