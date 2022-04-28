class Item < ApplicationRecord
  with_options presence: true do
    validates :code, uniqueness: true
    validates :item
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :registar, inclusion: { in: [true, false] }
  end
end