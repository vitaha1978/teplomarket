class Article < ActiveRecord::Base
  def to_param
    "#{id}-#{name}"
  end
end
