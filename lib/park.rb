class Park
  attr_reader :name,
              :trails

  def initialize(name)
    @name = name
    @trials = []
  end
end
