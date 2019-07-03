class Customer

  attr_reader :name, :wallet

  def initialize(name, wallet)
    @name = name
    @wallet = wallet
  end

  def buys_drink_from_pub(pub, drink)
    if pub.drinks_count > 0
    @wallet -= drink.price
    pub.increase_money(drink)
    pub.sell_drink(drink)
    end
  end



end
