class Item

  attr_reader :name
  def initialize(details)
    @name = details[:name]
    @price = details[:price]
  end

  def price
    @price.sub("$","").to_f
  end

end
