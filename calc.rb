class Calc
  attr_accessor :before, :before_with_water, :after, :after_with_water
  def initialize(before, before_with_water, after, after_with_water)
    @before = before
    @before_with_water = before_with_water
    @after = after
    @after_with_water = after_with_water
  end

  def drinked
    bring_water - bring_back
  end

  def bring_back
    after_with_water - after
  end

  def loss
    before - after
  end

  def sweat
    loss + drinked
  end

  def bring_water
    before_with_water - before
  end
end

c = Calc.new(80,85,76,79)
c = Calc.new(80,80,78,78)