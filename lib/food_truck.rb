class FoodTruck

  attr_reader :name, :inventory
  def initialize(name)
    @name = name
    @inventory = {}
  end

  def stock(item, count)
    @inventory[item] = 0 if @inventory[item].nil?
    @inventory[item] += count
  end

  def check_stock(item)
    return 0 if @inventory[item].nil?
    @inventory[item]
  end

  def potential_revenue
    @inventory.sum {|item, count| item.price * count}
  end

  def sell(item, count)
    # binding.pry
    @inventory[item] -= count
    # binding.pry
  end


end
