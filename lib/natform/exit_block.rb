class ExitBlock < Block
  def setup
    @width = @height = 60
    @image = Image.load_tiles($window, "media/white.png", @width, @height, false)[0]
    @color = Color.new(0xff808080)
    cache_bounding_box
  end
end
