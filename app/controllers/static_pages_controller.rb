class StaticPagesController < ApplicationController
  include CurrentCart
  before_action :set_cart
  
  def contacts
    @articles = Article.all
    @categories = Category.all
  end
end
