class Pub

  attr_reader :name, :till

  def initialize(name, till, drinks)
    @name = name
    @till = till
    @drinks = drinks
  end

  def drinks_count
    return @drinks.size
  end

  def drink_array
    return @drinks
  end

  def sell_drink(drink)
    @drinks.delete(drink)
  end

  def increase_money(drink)
    @till += drink.price
  end

  def sells_drink_to_customer(customer, drink)
    if drinks_count > 0
      if customer.age > 25
        if customer.drunk_level < 8
          customer.spends_money(drink)
          increase_money(drink)
          sell_drink(drink)
          customer.drunk_level += drink.alcohol_level
        end
        p "Youre too drunk, go home!"
      end
      p "Youre too young, how about a coke?"
    end
  end


end
