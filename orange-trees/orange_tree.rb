class OrangeTree
  class NoOrangesError < StandardError
  end

  attr_accessor :age, :height, :oranges

  def initialize(age=0, height=0)
    @age = age
    @height = height
    @oranges = []
  end

  def pass_growing_season
    oranges.clear
    self.age += YEAR
    if height < MAXIMUM_HEIGHT
      self.height += ANNUAL_GROWTH
    end
    if mature?
      self.oranges = Array.new(rand(100.300)) {Orange.new}
    end
  end

  def mature?
    age >= MATURE_AGE
  end

  def dead?
    age >= MAXIMUM_AGE
  end

  def has_oranges?
    oranges.length > 0
  end

  def pick_an_orange
    raise NoOrangesError, "This tree has no oranges" unless self.has_oranges?

    self.oranges.pop
  end
end

MAXIMUM_AGE = 100
MAXIMUM_HEIGHT = 25
MATURE_AGE = 6
ANNUAL_GROWTH = 2.5
YEAR = 1