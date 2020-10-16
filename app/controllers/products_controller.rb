class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :destroy]

  def index
    @products = Product.includes(:images).order('created_at DESC')
  end

  def new
    @product = Product.new
    @product.images.new
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      @product.images.new
      render :new
    end
  end


  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find_by(name: "#{params[:parent_name]}").children
  end

  def show
  end

  def destroy
    flash.now[:alert] = '削除に失敗しました' unless @product.destroy  
  end

  # エラーページ用
  def not_found

  end

  private

  def set_product
    # レコードの存在を確認し、なければnot_foundを返す
    if Product.exists?(params[:id])
      @product = Product.find(params[:id])
    else
      redirect_to not_found_path
    end  
  end

  def product_params
    params.require(:product).permit(:product_name, :product_detail, :category, :brand, :delivery_area, :price, :size_id, :product_status_id, :delivery_fee_id, :delivery_time_id, :trading_status,images_attributes: [:image]).merge(user_id: current_user.id)
  end
end
