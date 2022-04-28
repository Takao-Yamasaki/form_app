class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :code, null: false
      t.string :item, null: false
      t.integer :price, null: false

      t.timestamps
    end
  end
end
