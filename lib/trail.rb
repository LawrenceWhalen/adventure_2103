class Trail
  attr_reader :name,
              :length,
              :level

  def initialize(attributes)
    @name = attributes[:name]
    @length = attributes[:length]
    @level = attributes[:level]
  end

  def float_length
    @length.to_f
  end
end
