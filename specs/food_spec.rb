require('minitest/autorun')
require('minitest/rg')
require_relative('../food.rb')

class FoodTest < MiniTest::Test

  def setup()
    @food = Food.new("Burger", 15, 3)
  end

end
