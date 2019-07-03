require('minitest/autorun')
require('minitest/rg')
require_relative('../pub.rb')
require_relative('../drink.rb')
require_relative('../customer.rb')
require_relative('../food.rb')

class PubTest < MiniTest::Test

  def setup()
    @customer = Customer.new("Walter", 80, 26, 1)
    @customer2 = Customer.new("Walter", 80, 26, 9)
    @customer3 = Customer.new("Walter", 80, 24, 1)

    @food1 = Food.new("Burger", 15, 3)

    @drink1 = Drink.new("Mojito", 10, 3)
    @drink2 = Drink.new("White Russian", 10, 2)
    @drink3 = Drink.new("Palinka", 10, 8)

    @pub = Pub.new("Queens Head", 1000, [@drink1, @drink2, @drink3], [@food1], [{drink: @drink1, quantity: 10}, {drink: @drink2, quantity: 20}, {drink: @drink3, quantity: 5}])


  end

  def test_pub_name
    assert_equal("Queens Head",@pub.name)
  end

  def test_pub_till
    assert_equal(1000, @pub.till)
  end

  def test_pub_drinks_count
    assert_equal(3, @pub.drinks_count)
  end

  def test_sell_drink
    @pub.sell_drink(@drink1)
    assert_equal(2, @pub.drinks_count)
  end

  def test_till_gains_money
    @pub.increase_money(@drink1)
    assert_equal(1010, @pub.till)
  end

  def test_sell_drink_to_customer
    @pub.sells_drink_to_customer(@customer, @drink1)
    assert_equal(2, @pub.drinks_count)
    assert_equal(70, @customer.wallet)
    assert_equal(1010, @pub.till)
    assert_equal(4, @customer.drunk_level)
  end

  def test_sell_drink_to_customer__too_drunk
    @pub.sells_drink_to_customer(@customer2, @drink3)
    assert_equal(3, @pub.drinks_count)
    assert_equal(80, @customer2.wallet)
    assert_equal(1000, @pub.till)
    assert_equal(9, @customer2.drunk_level)
  end

  def test_sell_drink_to_customer__too_young
    @pub.sells_drink_to_customer(@customer3, @drink2)
    assert_equal(3, @pub.drinks_count)
    assert_equal(80, @customer3.wallet)
    assert_equal(1000, @pub.till)
    assert_equal(1, @customer3.drunk_level)
  end

  def test_sell_food_to_customer
    @pub.sells_food_to_customer(@customer, @food1)
    assert_equal(0, @pub.food_count)
    assert_equal(65, @customer.wallet)
    assert_equal(1015, @pub.till)
    assert_equal(-2, @customer.drunk_level)
  end


  def test_number_of_stock
    assert_equal(10, @pub.stock_lvl[0][:quantity])
  end
end
