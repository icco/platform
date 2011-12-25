class Level < Chingu::GameState
  trait :timer
  attr_reader :player, :game_object_map, :floor_y, :grid, :floor

  def initialize
    super

    self.input = { :p => Chingu::GameStates::Pause }
    on_input(:esc) { $window.close }

    @floor_y = $window.height - 32*2 - 1
    @player = Player.create(:x => 40, :y => @floor_y)
  end
end
