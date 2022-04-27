class Item < ApplicationRecord
  with_options presence: true do
    validates :register, inclusion: { in: [true, false] }
  end
end
