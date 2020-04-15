require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/item'
require './lib/food_truck'


class FoodTruckTest < Minitest::Test

  def test_it_exists
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})

    food_truck = FoodTruck.new("Rocky Mountain Pies")
    assert_instance_of FoodTruck, food_truck
  end

  def test_it_returns_attributes
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    assert_equal "Rocky Mountain Pies", food_truck.name
  end

end



# #=> #<FoodTruck:0x00007f85683152f0...>
#
# #=> "Rocky Mountain Pies"
#    food_truck.inventory
# #=> {}
#
#food_truck.check_stock(item1)
# #=> 0
#
#food_truck.stock(item1, 30)
#
#food_truck.inventory
# #=> {#<Item:0x007f9c56740d48...> => 30}
#
#food_truck.check_stock(item1)
# #=> 30
#
#food_truck.stock(item1, 25)
#
#food_truck.check_stock(item1)
# #=> 55
#
#food_truck.stock(item2, 12)
#
#food_truck.inventory
# #=> {#<Item:0x007f9c56740d48...> => 55, #<Item:0x007f9c565c0ce8...> => 12}
