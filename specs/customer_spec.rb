require('minitest/autorun')
require('minitest/rg')
require_relative('../customer.rb')
require_relative('../drink.rb')
require_relative('../pub.rb')
require_relative('../food.rb')


class CustomerTest < MiniTest::Test

  def setup()

    @drink1 = Drink.new("Mojito", 10, 3)
    @drink2 = Drink.new("White Russian", 10, 2)
    @drink3 = Drink.new("Palinka", 10, 8)

    @food1 = Food.new("Burger", 15, 3)

    @pub = Pub.new("Queens Head", 1000, [@drink1, @drink2, @drink3], [@food1], {@drink1 => 10, @drink2 => 5, @drink3 => 2})

    @customer = Customer.new("Walter", 80, 26, 1)
  end

  def test_customer_name
    assert_equal("Walter", @customer.name)
  end

  def test_customer_wallet
    assert_equal(80, @customer.wallet)
  end

  # def test_customer_buys_drink
  #   @customer.buys_drink_from_pub(@pub, @drink1)
  #   assert_equal(2, @pub.drinks_count)
  #   assert_equal(70, @customer.wallet)
  #   assert_equal(1010, @pub.till)
  # end

  def test_customer_drunkness_buys_food
    @customer.buys_food(@food1)
    assert_equal(-2, @customer.drunk_level)
    assert_equal(65, @customer.wallet)
  end



end
