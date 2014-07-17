class Category < ActiveRecord::Base
  has_many :articles
  
  def to_param
    "#{id}-#{url}"
  end
end
