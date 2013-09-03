class GameWindow < Chingu::Window
  def initialize
    super CONFIG[:window][:width], CONFIG[:window][:height]
    @background = Image["media/space.png"]
  end

  def setup
    retrofy
    switch_game_state(LevelOne)
  end

  def draw
    super
    @background.draw 0, 0, 0
  end
end
