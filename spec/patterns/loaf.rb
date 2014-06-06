module PatternsHelper

  def loaf_universe
    map            = Map.generate(5, 5)
    universe       = Universe.empty(map)
    universe.cells = loaf_result

    universe
  end

  def loaf_result
    [
      DeadCell.new(   Location.new(x: 0, y: 0)),
      DeadCell.new(   Location.new(x: 1, y: 0)),
      DeadCell.new(   Location.new(x: 2, y: 0)),
      DeadCell.new(   Location.new(x: 3, y: 0)),
      DeadCell.new(   Location.new(x: 4, y: 0)),
      DeadCell.new(   Location.new(x: 5, y: 0)),

      DeadCell.new(   Location.new(x: 0, y: 1)),
      DeadCell.new(   Location.new(x: 1, y: 1)),
      LivingCell.new( Location.new(x: 2, y: 1)),
      LivingCell.new( Location.new(x: 3, y: 1)),
      DeadCell.new(   Location.new(x: 4, y: 1)),
      DeadCell.new(   Location.new(x: 5, y: 1)),

      DeadCell.new(   Location.new(x: 0, y: 2)),
      LivingCell.new( Location.new(x: 1, y: 2)),
      DeadCell.new(   Location.new(x: 2, y: 2)),
      DeadCell.new(   Location.new(x: 3, y: 2)),
      LivingCell.new( Location.new(x: 4, y: 2)),
      DeadCell.new(   Location.new(x: 5, y: 2)),

      DeadCell.new(   Location.new(x: 0, y: 3)),
      DeadCell.new(   Location.new(x: 1, y: 3)),
      LivingCell.new( Location.new(x: 2, y: 3)),
      DeadCell.new(   Location.new(x: 3, y: 3)),
      LivingCell.new( Location.new(x: 4, y: 3)),
      DeadCell.new(   Location.new(x: 5, y: 3)),

      DeadCell.new(   Location.new(x: 0, y: 4)),
      DeadCell.new(   Location.new(x: 1, y: 4)),
      DeadCell.new(   Location.new(x: 2, y: 4)),
      LivingCell.new( Location.new(x: 3, y: 4)),
      DeadCell.new(   Location.new(x: 4, y: 4)),
      DeadCell.new(   Location.new(x: 5, y: 4)),

      DeadCell.new(   Location.new(x: 0, y: 5)),
      DeadCell.new(   Location.new(x: 1, y: 5)),
      DeadCell.new(   Location.new(x: 2, y: 5)),
      DeadCell.new(   Location.new(x: 3, y: 5)),
      DeadCell.new(   Location.new(x: 4, y: 5)),
      DeadCell.new(   Location.new(x: 5, y: 5)),
    ]
  end

end
