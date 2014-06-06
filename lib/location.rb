class Location
  attr_accessor :x, :y

  def initialize(x:, y:)
    self.x = x
    self.y = y
  end

  def neighbours
    neighbours_coordinates.map do |coordinate|
      Location.new(coordinate)
    end
  end

  def ==(other)
    x == other.x && y == other.y
  end

  def eql?(other)
    self == other
  end

  def to_s
    "x: #{x}, y: #{y}"
  end

  def hash
    x.hash + y.hash
  end

  private

  def neighbours_coordinates
    [
      { x: x - 1, y: y + 1 },
      { x: x    , y: y + 1 },
      { x: x + 1, y: y + 1 },
      { x: x + 1, y: y     },
      { x: x + 1, y: y - 1 },
      { x: x    , y: y - 1 },
      { x: x - 1, y: y - 1 },
      { x: x - 1, y: y     },
    ]
  end
end


class Map
  attr_accessor :width, :height, :locations

  def initialize(width, height)
    self.width     = width
    self.height    = height
    self.locations = []
  end

  def self.generate(width, height)
    new(width, height).generate
  end

  def generate
    (0..height).each do |y|
      (0..width).each do |x|
        locations << Location.new(x: x, y: y)
      end
    end

    self
  end

end
