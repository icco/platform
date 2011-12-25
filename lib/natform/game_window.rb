class GameWindow < Chingu::Window
  def initialize
    super(
      CONFIG[:window][:width],
      CONFIG[:window][:height],
      false
    )

    $window.fill(Gosu::Color.argb(0xff808080))

    self.caption = "Natform (sadnat.com/game)"

    # Player will automatically be updated and drawn since it's a Chingu::GameObject
    # You'll need your own Chingu::Window#update and Chingu::Window#draw after a while, but just put #super there and Chingu can do its thing.
    @player = Player.create
    @player.input = {:left => :move_left, :right => :move_right}

    @font = Gosu::Font.new(self, Gosu::default_font_name, 20)
  end
end
