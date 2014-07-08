class Article < ActiveRecord::Base
  def to_param
    "#{id}-#{url}"
  end
end
