class ItemForm
  include ActiveModel::Model
  attr_accessor :code, :item, :price

  def save
    Item.create(code: code, item: item, price: price)
  end
end