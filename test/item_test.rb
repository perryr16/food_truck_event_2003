require 'minitest/autorun'
require 'minitest/pride'
require './lib/item'
require 'pry'

class ItemTest < Minitest::Test

  def test_it_exists
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    assert_instance_of Item, item1
  end

  def test_it_returns_attributes
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    assert_equal "Apple Pie (Slice)", item2.name
    assert_equal 2.50, item2.price

  end

end


# #=> #<Item:0x007f9c56740d48...>
#
# #=> #<Item:0x007f9c565c0ce8...>
#
# #=> "Apple Pie (Slice)"
#
# #=> 2.50
