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

  def trails_by_level
    @trails.each_with_object({}) do |trail, hash|
      if hash[trail.level].nil?
        hash[trail.level] = [trail.name]
      else
        hash[trail.level].push(trail.name)
      end
    end
  end
end
