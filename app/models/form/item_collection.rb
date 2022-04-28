class Form::ItemCollection < Form::Base
  DEFAULT_ITEM_COUNT = 5
  attr_accessor :items

  def initialize(attributes = {})
    super attributes
    self.items = DEFAULT_ITEM_COUNT.times.map { Form::Item.new } unless self.items.present?
  end

  def items_attributes=(attributes)
    self.items = attributes.map { |_, items_attributes| Item.new(items_attributes) } 
  end
  
  # バリデーションチェック
  def valid?
    valid_items = target_items.map(&:valid?).all?
    super && valid_items
  end

  # 保存処理
  def save
    return false unless valid?
    Item.transaction do
      target_items.map do |item|
        item.save! if item.registar?
      end
    end
    true
  end

  def target_items
    self.items.select { |v| v.registar }
  end
end