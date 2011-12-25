class GameWindow < Chingu::Window
  def initialize
    super(
      CONFIG[:window][:width],
      CONFIG[:window][:height]
    )

    self.fill(Gosu::Color::WHITE)

    self.caption = "Natform (sadnat.com/game)"

    push_game_state(Level)
  end

  def setup
  end
end
