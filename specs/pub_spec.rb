require('minitest/autorun')
require('minitest/rg')
require_relative('../pub.rb')
require_relative('../drink.rb')


class PubTest < MiniTest::Test

  def setup()
    @drink1 = Drink.new("Mojito", 10)
    @drink2 = Drink.new("White Russian", 10)
    @drink3 = Drink.new("Palinka", 10)

    @pub = Pub.new("Queens Head", 1000, [@drink1, @drink2, @drink3])
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


end
