require 'minitest/spec'
require 'minitest/autorun'

class DiameterDouble
  def diameter  # The interface changes to 'width',
    10          # but this double and Gear both
  end           # still use 'diameter'
end

module DiameterizableInterfaceTest
  def test_implements_the_diameterizable_interface
    assert_respond_to(@object, :width)
  end
end

class GearTest < MiniTest::Unit::TestCase
  def test_calculates_gear_inches
    gear  =   Gear.new(
                chainring: 52,
                cog:       11,
                wheel:     DiameterDouble.new)

    assert_in_delta(47.27,
                    gear.gear_inches,
                    0.01)
  end
end

class WheelTest < MiniTest::Unit::TestCase
  include DiameterizableInterfaceTest

  def setup
    @wheel = @object = Wheel.new(26,1.5)
  end


  def test_calculates_diameter
    wheel = Wheel.new(26, 1.5)

    assert_in_delta(29,
                    wheel.width,
                    0.01)
  end
end
