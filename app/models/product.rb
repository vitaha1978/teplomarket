class Product < ActiveRecord::Base

  has_many :line_items
  has_many :orders, through: :line_items
  belongs_to :category
  belongs_to :brand
  
  before_destroy :ensure_not_referenced_by_any_line_item

  validates :title, :description, :image_url, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates :title, uniqueness: true
  validates :url, uniqueness: true
  validates :image_url, allow_blank: true, format: {
            with: %r{\.(gif|jpg|png|jpeg)\Z}i,
            message: 'повинен бути у форматі GIF, JPG, JPEG або PNG.'
            }

  def to_param
    "#{id}-#{url}"
  end

  private
  
    # Переконуємося у відсутності товарних позицій, що ссилаються на даний товар
    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
        return true
      else
        errors.add(:base, 'Існують товарні позиції які ссилаються на даний товар')
        return false
      end
    end
end
