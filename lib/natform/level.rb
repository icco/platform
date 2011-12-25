class Level < Chingu::GameState
  trait :timer
  attr_reader :player, :floor_y

  def initialize
    super

    self.input = { :p => Chingu::GameStates::Pause }
    on_input(:esc) { $window.close }

    @floor_y = $window.height - 32*2 - 1

    # Player will automatically be updated and drawn since it's a
    # Chingu::GameObject. You'll need your own Chingu::Window#update and
    # Chingu::Window#draw after a while, but just put #super there and Chingu
    # can do its thing.
    @player = Player.create(:x => 40, :y => @floor_y)
  end
end
