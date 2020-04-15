class Event

  attr_reader :name, :food_trucks
  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    @food_trucks.map {|truck| truck.name}
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all do|truck|
      !truck.inventory[item].nil?
    end
  end

  def total_inventory
    total_inventory = Hash.new { |hash, key| hash[key] =  {:quantity => 0, :food_trucks => []}}
    @food_trucks.each do |truck|
      truck.inventory.each do |item, count|
        total_inventory[item][:quantity] += count
        total_inventory[item][:food_trucks] << truck
      end
    end
    total_inventory
  end

  def overstocked_items
    #2 vendors, more than 50
    overstocked_items = []
    total_inventory.each do |item, details|
      overstocked_items << item if details[:quantity] > 50 && details[:food_trucks].length > 1
    end
    overstocked_items
  end

  def sorted_item_list
    total_inventory.map { |item, details| item.name}.sort
  end

  def date
    date = Date.today
    date.strftime("%d/%m/%Y")
  end


end
