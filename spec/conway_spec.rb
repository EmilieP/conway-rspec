require 'spec_helper'

describe "Cell's rules" do
  before :each do
    location     = Location.new(x: 2, y: 2)
    @living_cell = LivingCell.new location
    @dead_cell   = DeadCell.new location
  end

  it "Any live cell with fewer than two live neighbours dies" do
    expect(@living_cell.dies?(1)).to be_true
  end

  it "Any live cell with two or three live neighbours lives on to the next generation" do
    expect(@living_cell.dies?(2)).to be_false
    expect(@living_cell.dies?(3)).to be_false
  end

  it "Any live cell with more than three live neighbours dies" do
    expect(@living_cell.dies?(4)).to be_true
  end

  it "Any dead cell with exactly three live neighbours becomes a live cell" do
    expect(@dead_cell.revives?(2)).to be_false
    expect(@dead_cell.revives?(3)).to be_true
    expect(@dead_cell.revives?(4)).to be_false
  end
end

describe "Cell" do
  before :each do
    location = Location.new(x: 2, y: 2)
    @cell    = Cell.new location
    @expected_neighbours = [
      Location.new(x: 1, y: 3),
      Location.new(x: 2, y: 3),
      Location.new(x: 3, y: 3),
      Location.new(x: 3, y: 2),
      Location.new(x: 3, y: 1),
      Location.new(x: 2, y: 1),
      Location.new(x: 1, y: 1),
      Location.new(x: 1, y: 2)
    ]
  end

  it "A cell knows its neighbours" do
    expect(@cell.neighbours).to match_array(@expected_neighbours)
  end
end

describe "Universe" do
  before :each do
    srand(123)
    @map = Map.generate(2, 2)
    @universe = Universe.empty(@map)
    @expected_locations = [
      Location.new(x: 0, y: 0),
      Location.new(x: 0, y: 1),
      Location.new(x: 0, y: 2),
      Location.new(x: 1, y: 0),
      Location.new(x: 1, y: 1),
      Location.new(x: 1, y: 2),
      Location.new(x: 2, y: 0),
      Location.new(x: 2, y: 1),
      Location.new(x: 2, y: 2)
    ]
  end

  it "Before Big Bang, Universe is empty" do
    expect(@universe.population).to eql(0)
  end

  it "After Big Bang, Universe borns populated by living cells" do
    @universe.populate(0.5)
    expect(@universe.population).to eql(4)
  end

  it "Universe has limits" do
    expect(@universe.map.locations).to match_array(@expected_locations)
  end

  it "Universe is dead when all cells are dead" do
    @universe.populate(0)
    expect(@universe.is_dead?).to be_true
  end
end

describe "Cell in Universe" do
  before :each do
    @map = Map.generate(1, 1)
    @universe = Universe.empty(@map)
    @universe.cells = [
      LivingCell.new( Location.new(x: 0, y: 0)),
      DeadCell.new(   Location.new(x: 0, y: 1)),
      DeadCell.new(   Location.new(x: 1, y: 0)),
      LivingCell.new( Location.new(x: 1, y: 1))
    ]
    @living_location = Location.new(x: 0, y: 0)
    @living_cell     = LivingCell.new( @living_location  )
    @cell            = @universe.cell_by_location(@living_location)
  end

  it "Universe can find a cell by it location" do
    expect(@cell).to eql(@living_cell)
  end

  it "Universe can find neighbours of a cell" do
    neighbours          = @universe.cell_neighbours(@cell)
    expected_neighbours = [
      DeadCell.new(   Location.new(x: 0, y: 1)),
      LivingCell.new( Location.new(x: 1, y: 1)),
      DeadCell.new(   Location.new(x: 1, y: 0))
    ]
    expect(neighbours).to eql(expected_neighbours)
  end
end

describe "Still lifes" do
  { block: 'Block', boat: 'Boat', beehive: 'Beehive', loaf: 'Loaf' }.each do |key, value|
    it "#{value} pattern" do
      universe = universe(key)
      universe = universe.tick
      expect(universe.cells).to match_array(result(key))
    end
  end
end

describe "Oscillators" do
  { blinker: 'Blinker', toad: 'Toad', beacon: 'Beacon' }.each do |key, value|
    it "#{value} pattern" do
      universe = universe(key)
      universe.display
      universe = universe.tick
      universe.display
      expect(universe.cells).to match_array(result(key))
      universe = universe.tick
      universe.display
      expect(universe.cells).to match_array(init(key))
    end
  end
end
