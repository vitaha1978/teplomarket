class StoreController < ApplicationController
  def index
    @products = Product.order("RANDOM()").limit(4)
    @articles = Article.all
  end
end
