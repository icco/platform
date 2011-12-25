class Block < Chingu::GameObject
  trait :collision_detection
  trait :bounding_box, :debug => false

  def initialize
    self.zorder = 10
  end
end
