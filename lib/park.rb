class Park
  attr_reader :name,
              :trails

  def initialize(name)
    @name = name
    @trails = []
  end

  def add_trail(trail)
    @trails.push(trail)
  end

  def trails_shorter_than(milage)
    @trails.find_all do |trail|
      trail.float_length < milage
    end
  end

  def hikeable_miles
    @trails.sum do |trail|
      trail.float_length
    end
  end

  def trails_of_level(level)
    @trails.find_all do |trail|
      trail.level == level
    end
  end
end
