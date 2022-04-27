class Form::ItemCollection < Form::Base
  DEFAULT_ITEM_COUNT = 5
  attr_accessor :items

  def initialize(attributes = {})
    super attributes
    self.items = DEFAULT_ITEM_COUNT.times.map { Form::Item.new } unless items.present?
  end

  def items_attributes=(attributes)
    self.items = attributes.map do | _, items_attributes |
      Form::Item.new(items_attributes)
    end
  end
  
  # バリデーションチェック
  def valid?
    valid_items = target_items.map(&:valid?).all?
    super && valid_items
  end

  # 保存処理
  def save
    return false unless valid?
    Item.transaction { target_items.each(&:save!) }
    true
  end

  def target_items
    self.items.select { |v| v.register }
  end
end