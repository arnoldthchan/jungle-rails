class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
    # @products = Product.where('price_cents > ?', 10000).order(created_at: :desc)
    # raise
    # byebug
  end

  def show
    @product = Product.find params[:id]
  end

end
