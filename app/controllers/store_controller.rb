class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart
  
  def index
    @products = Product.last(4)
    @articles = Article.all
  end
end
