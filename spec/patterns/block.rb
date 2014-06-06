module PatternsHelper

  def block_universe
    map            = Map.generate(3, 3)
    universe       = Universe.empty(map)
    universe.cells = block_result

    universe
  end

  def block_result
    [
      DeadCell.new(   Location.new(x: 0, y: 3)),
      DeadCell.new(   Location.new(x: 1, y: 3)),
      DeadCell.new(   Location.new(x: 2, y: 3)),
      DeadCell.new(   Location.new(x: 3, y: 3)),

      DeadCell.new(   Location.new(x: 0, y: 2)),
      LivingCell.new( Location.new(x: 1, y: 2)),
      LivingCell.new( Location.new(x: 2, y: 2)),
      DeadCell.new(   Location.new(x: 3, y: 2)),

      DeadCell.new(   Location.new(x: 0, y: 1)),
      LivingCell.new( Location.new(x: 1, y: 1)),
      LivingCell.new( Location.new(x: 2, y: 1)),
      DeadCell.new(   Location.new(x: 3, y: 1)),

      DeadCell.new(   Location.new(x: 0, y: 0)),
      DeadCell.new(   Location.new(x: 1, y: 0)),
      DeadCell.new(   Location.new(x: 2, y: 0)),
      DeadCell.new(   Location.new(x: 3, y: 0)),
    ]
  end

end
