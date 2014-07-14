class Order < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  
  PAYMENT_TYPES = [ "Оплата при отриманні", "Оплата кредитною карткою", "Оплата з ПДВ" ]
  
  validates :name, :phone, :email, presence: true
  validates :pay_type, inclusion: PAYMENT_TYPES
  
  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end
