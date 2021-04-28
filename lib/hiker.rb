class Hiker
  attr_reader :name,
              :experience_level,
              :snacks,
              :parks_visited

  def initialize(name, experience_level)
    @name = name
    @experience_level = experience_level
    @snacks = {}
    @parks_visited = []
  end

  def pack(snack, amount)
    if @snacks[snack].nil?
      @snacks[snack] = amount
    else
      @snacks[snack] += amount
    end
  end

  def visit(park)
    @parks_visited.push(park)
  end

  def possible_trails
    @parks_visited.flat_map do |park|
      park.trails_of_level(@experience_level)
    end
  end

  def favorite_snack
    @snacks.to_a.max_by do |_name, amount|
      amount
    end[0]
  end
end
