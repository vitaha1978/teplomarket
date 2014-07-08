class Article < ActiveRecord::Base
  validates :title, :description, :name, :text, :url, presence: true
  validates :name, uniqueness: true
  validates :url, uniqueness: true
  
  def to_param
    "#{id}-#{url}"
  end
end
