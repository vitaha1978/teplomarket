class AddMiniTitleToProducts < ActiveRecord::Migration
  def change
    add_column :products, :mini_title, :string
  end
end
