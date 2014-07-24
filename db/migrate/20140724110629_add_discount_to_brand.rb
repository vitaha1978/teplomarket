class AddDiscountToBrand < ActiveRecord::Migration
  def change
    add_column :brands, :discount, :integer
  end
end
