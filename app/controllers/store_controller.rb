class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart
  def index
    @products = Product.order(:title)
    if params[:category]
      @products = Product.where(category: params[:category])
    elsif params[:term]
      @products = Product.where(["title LIKE ? OR description LIKE ?", "%#{params[:term]}%", "%#{params[:term]}%"])
    else
      @products = Product.all
    end
  end
end
