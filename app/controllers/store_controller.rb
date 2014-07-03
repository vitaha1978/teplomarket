class StoreController < ApplicationController
  def index
    @products = Product.order(:title)
    @articles = Article.all
  end
end
