class Category < ActiveRecord::Base
  has_many :articles
  has_many :products
  
  def to_param
    "#{id}-#{url}"
  end
end
