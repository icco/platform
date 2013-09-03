class GrassBlock < Block
  def setup
    @width = @height = 60
    @grass, @dirt = *Image.load_tiles($window, "media/tileset.png", @width, @height, false)
    @image = @grass
    @color = Color.new(0xff808080)
    cache_bounding_box
  end
end
