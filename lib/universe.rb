class Universe

  attr_accessor :cells, :map

  def initialize(map)
    self.cells = []
    self.map   = map
  end

  def self.empty(map)
    new(map)
  end

  def population
    Cell.count(cells)
  end

  def populate(seed_probability)
    map.locations.each do |location|
      cell = seed_probability > rand ? LivingCell : DeadCell
      cells << cell.new(location)
    end
  end

  def is_dead?
    population.zero?
  end

  def cell_by_location(location)
    cells.select{ |cell| cell.location == location }.first
  end

  def cell_neighbours(cell)
    neighbours_location = cell.neighbours & map.locations
    neighbours_location.flat_map{ |location| cell_by_location(location) }
  end

  def tick
    universe = Universe.empty(map)
    cells.each do |cell|
      neighbours = cell_neighbours(cell)
      neighbours = Cell.count(neighbours)
      universe.cells << cell.transform(neighbours)
    end

    universe
  end

  def display
    cells.each_with_index do |cell, index|
      if index % (map.width+1) == 0
        puts "\n"
      end
      print cell.display
    end
    puts "\n"
  end

end
