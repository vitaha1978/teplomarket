class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart
  
  def index
    @products_mini = Product.where(id: Product.pluck(:id).sample(4))
    @products = Product.all
    @articles = Article.all
    @article_flagman = Article.last
    @categories = Category.all
  end
end
