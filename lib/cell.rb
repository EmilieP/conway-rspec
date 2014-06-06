class Cell

  attr_accessor :location

  def initialize(location)
    self.location = location
  end

  def revives?(neighbours)
    false
  end

  def dies?(neighbours)
    false
  end

  def neighbours
    location.neighbours
  end

  def ==(other)
    self.is_a?(other.class) && location == other.location
  end

  def eql?(other)
    self == other
  end

  def self.count(cells)
    cells.count{ |cell| cell.is_a? LivingCell }
  end

  def display
    '- '
  end

  def to_s
    display + location.to_s
  end

end

class LivingCell < Cell
  def dies?(neighbours)
    neighbours != 2 && neighbours != 3
  end

  def display
    '• '
  end

  def transform(neighbours)
    return self unless dies?(neighbours)
    DeadCell.new(location)
  end

end

class DeadCell < Cell
  def revives?(neighbours)
    neighbours == 3
  end

  def display
    '  '
  end

  def transform(neighbours)
    return self unless revives?(neighbours)
    LivingCell.new(location)
  end

end
