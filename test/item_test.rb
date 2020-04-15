require 'minitest/autorun'
require 'minitest/pride'
require './lib/item'
require 'pry'

class ItemTest < Minitest::Test

  def test_it_exists
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    assert_instance_of Item, item1
  end

end


# #=> #<Item:0x007f9c56740d48...>
#
#item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
# #=> #<Item:0x007f9c565c0ce8...>
#
#item2.name
# #=> "Apple Pie (Slice)"
#
#item2.price
# #=> 2.50
