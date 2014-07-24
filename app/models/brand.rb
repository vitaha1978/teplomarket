class Brand < ActiveRecord::Base
  has_many :products
  
  def to_param
    "#{id}-#{url}"
  end
end
