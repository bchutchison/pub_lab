class Customer

  attr_reader :name, :wallet, :age
  attr_accessor :drunk_level

  def initialize(name, wallet, age, drunk_level)
    @name = name
    @wallet = wallet
    @age = age
    @drunk_level = drunk_level
  end

  def spends_money(drink)
    @wallet -= (drink.price)
  end

  # def buys_drink_from_pub(pub, drink)
  #   if pub.drinks_count > 0
  #   @wallet -= drink.price
  #   pub.increase_money(drink)
  #   pub.sell_drink(drink)
  #   end
  # end

  def buys_food(food)
    @drunk_level -= food.rejuvenation_level
    @wallet -= (food.price)
  end


end
