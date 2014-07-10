class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart
  
  def index
    @products_mini = Product.last(4)
    @products = Product.all
    @articles = Article.all
  end
end
