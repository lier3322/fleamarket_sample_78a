class ItemsController < ApplicationController
  def index
    @products = Product.includes(:images).order('created_at DESC').first(5)
  end
end
