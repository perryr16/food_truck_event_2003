require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/item'
require './lib/food_truck'
require './lib/event'
require 'date'
require 'mocha/minitest'

class EventTest < Minitest::Test

  def test_it_exists
    event = Event.new("South Pearl Street Farmers Market")
    assert_instance_of Event, event
  end

  def test_it_returns_attributes
    event = Event.new("South Pearl Street Farmers Market")
    assert_equal "South Pearl Street Farmers Market", event.name
  end

  def test_it_adds_food_trucks
    event = Event.new("South Pearl Street Farmers Market")
    assert_equal [], event.food_trucks
    food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    food_truck1.stock(item1, 35)
    food_truck1.stock(item2, 7)
    food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    food_truck2.stock(item4, 50)
    food_truck2.stock(item3, 25)
    food_truck3 = FoodTruck.new("Palisade Peach Shack")
    food_truck3.stock(item1, 65)
    event.add_food_truck(food_truck1)
    event.add_food_truck(food_truck2)
    event.add_food_truck(food_truck3)
    expected  = [food_truck1, food_truck2, food_truck3]
    assert_equal expected, event.food_trucks

  end

  def test_it_returns_truck_names
    event = Event.new("South Pearl Street Farmers Market")
    food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    food_truck1.stock(item1, 35)
    food_truck1.stock(item2, 7)
    food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    food_truck2.stock(item4, 50)
    food_truck2.stock(item3, 25)
    food_truck3 = FoodTruck.new("Palisade Peach Shack")
    food_truck3.stock(item1, 65)
    event.add_food_truck(food_truck1)
    event.add_food_truck(food_truck2)
    event.add_food_truck(food_truck3)

    expected = ["Rocky Mountain Pies", "Ba-Nom-a-Nom", "Palisade Peach Shack"]
    assert_equal expected, event.food_truck_names
  end

  def test_it_returns_trucks_that_sell_item
    event = Event.new("South Pearl Street Farmers Market")
    food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    food_truck1.stock(item1, 35)
    food_truck1.stock(item2, 7)
    food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    food_truck2.stock(item4, 50)
    food_truck2.stock(item3, 25)
    food_truck3 = FoodTruck.new("Palisade Peach Shack")
    food_truck3.stock(item1, 65)
    event.add_food_truck(food_truck1)
    event.add_food_truck(food_truck2)
    event.add_food_truck(food_truck3)
    expected = [food_truck1, food_truck3]
    event.food_trucks_that_sell(item1)
    expected = [food_truck2]
    event.food_trucks_that_sell(item4)
  end

  def test_it_returns_revenue_of_trucks
    event = Event.new("South Pearl Street Farmers Market")
    food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    food_truck1.stock(item1, 35)
    food_truck1.stock(item2, 7)
    food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    food_truck2.stock(item4, 50)
    food_truck2.stock(item3, 25)
    food_truck3 = FoodTruck.new("Palisade Peach Shack")
    food_truck3.stock(item1, 65)
    event.add_food_truck(food_truck1)
    event.add_food_truck(food_truck2)
    event.add_food_truck(food_truck3)
    assert_equal 148.75, food_truck1.potential_revenue
    assert_equal 345.00, food_truck2.potential_revenue
    assert_equal 243.75, food_truck3.potential_revenue
  end

  def test_case_name
    event = Event.new("South Pearl Street Farmers Market")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    food_truck1.stock(item1, 35)
    food_truck1.stock(item2, 7)
    food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    food_truck2.stock(item4, 50)
    food_truck2.stock(item3, 25)
    food_truck3 = FoodTruck.new("Palisade Peach Shack")
    food_truck3.stock(item1, 65)
    food_truck3.stock(item3, 10)
    event.add_food_truck(food_truck1)
    event.add_food_truck(food_truck2)
    event.add_food_truck(food_truck3)

    expected = {
                item1 => {
                  quantity: 100,
                  food_trucks: [food_truck1, food_truck3]
                },
                item2 => {
                  quantity: 7,
                  food_trucks: [food_truck1]
                },
                item4 => {
                  quantity: 50,
                  food_trucks: [food_truck2]
                },
                item3 => {
                  quantity: 35,
                  food_trucks: [food_truck2, food_truck3]
                },
              }

    assert_equal expected, event.total_inventory
  end

  def test_it_returns_overstocked_items
    event = Event.new("South Pearl Street Farmers Market")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    food_truck1.stock(item1, 35)
    food_truck1.stock(item2, 7)
    food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    food_truck2.stock(item4, 50)
    food_truck2.stock(item3, 25)
    food_truck3 = FoodTruck.new("Palisade Peach Shack")
    food_truck3.stock(item1, 65)
    food_truck3.stock(item3, 10)
    event.add_food_truck(food_truck1)
    event.add_food_truck(food_truck2)
    event.add_food_truck(food_truck3)

    assert_equal [item1], event.overstocked_items
  end

  def test_retruns_sorted_items_by_name_alpha
    event = Event.new("South Pearl Street Farmers Market")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    food_truck1.stock(item1, 35)
    food_truck1.stock(item2, 7)
    food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    food_truck2.stock(item4, 50)
    food_truck2.stock(item3, 25)
    food_truck3 = FoodTruck.new("Palisade Peach Shack")
    food_truck3.stock(item1, 65)
    food_truck3.stock(item3, 10)
    event.add_food_truck(food_truck1)
    event.add_food_truck(food_truck2)
    event.add_food_truck(food_truck3)

    expected = ["Apple Pie (Slice)", "Banana Nice Cream", "Peach Pie (Slice)", "Peach-Raspberry Nice Cream"]
    assert_equal expected, event.sorted_item_list
  end

  def test_it_returns_date
    event = Event.new("South Pearl Street Farmers Market")
    event.stubs(:date).returns("24/02/2020")
    assert_equal "24/02/2020", event.date
  end

  def test_it_returns_sell_status
  skip

    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    item5 = Item.new({name: 'Onion Pie', price: '$25.00'})
  end

end



# # A event will now be created with a date - whatever date the event is created on through the use of `Date.today`. The addition of a date to the event should NOT break any previous tests.  The `date` method will return a string representation of the date - 'dd/mm/yyyy'. We want you to test this in with a date that is IN THE PAST. In order to test the date method in a way that will work today, tomorrow and on any date in the future, you will need to use a stub :)
#
#food_truck1 = FoodTruck.new("Rocky Mountain Pies")
# #=> #<FoodTruck:0x00007fe1348a1160...>
#
#food_truck1.stock(item1, 35)
#
#food_truck1.stock(item2, 7)
#
#food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
# #=> #<FoodTruck:0x00007fe1349bed40...>
#
#food_truck2.stock(item4, 50)
#
#food_truck2.stock(item3, 25)
#
#food_truck3 = FoodTruck.new("Palisade Peach Shack")
# #=> #<FoodTruck:0x00007fe134910650...>
#
#food_truck3.stock(item1, 65)
#
#event.add_food_truck(food_truck1)
#
#event.add_food_truck(food_truck2)
#
#event.add_food_truck(food_truck3)
#
#event.sell(item1, 200)
# #=> false
#
#event.sell(item5, 1)
# #=> false
#
#event.sell(item4, 5)
# #=> true
#
#food_truck2.check_stock(item4)
# #=> 45
#
#event.sell(item1, 40)
# #=> true
#
#food_truck1.check_stock(item1)
# #=> 0
#
#food_truck3.check_stock(item1)
# #=> 60
