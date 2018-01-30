class RevealingReferences
  attr_reader :wheels
  def initialize(data)
    @wheels = wheelify(data)
  end

  def diameters
    wheels.collect { |wheel| diameter(wheel) }
  end

  def diameter(wheel)
    wheel.rim + (wheel.rim * 2)
  end

  Wheel = Struct.new(:rim, :tire)
  def wheelify(data)
    deta.collect {|cell|
      Wheel.new(cell[0]m cell[1]) }
  end
end
