class AddImgToBrand < ActiveRecord::Migration
  def change
    add_column :brands, :img, :string
  end
end
