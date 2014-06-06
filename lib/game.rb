class Game

  attr_accessor :width, :height, :seed, :map, :universe

  def initialize(width, height, seed)
    self.width  = width
    self.height = height
    self.seed   = seed
    self.map    = ::Map.generate(width, height)
    self.universe = ::Universe.empty(map)
  end

  def self.start(width, height, seed)
    new(width, height, seed).start
  end

  def start
    universe.populate(seed)
    universe.display
    puts "\n"
    puts "\n"
    ticks = 0
    while continue? do
      self.universe = universe.tick
      system "clear"
      universe.display
      puts "\n"
      puts "\n"
      ticks += 1
      sleep 0.5
    end

    puts "#{ticks} generations"
  end


  def continue?
    !universe.is_dead?
  end
end
