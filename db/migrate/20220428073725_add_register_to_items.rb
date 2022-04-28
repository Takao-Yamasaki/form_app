class AddRegisterToItems < ActiveRecord::Migration[6.1]
  def up
    add_column :items, :registar, :boolean
  end

  def down
    remove_column :items, :registar, :boolean
  end
end
