class StoreController < ApplicationController
  def index
    @products = Product.last(4)
    @articles = Article.all
  end
end
