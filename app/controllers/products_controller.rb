class ProductsController < ApplicationController
  require 'payjp'
  before_action :set_product, only: [:show, :destroy, :purchase_check, :purchase_completed]

  def index
    @products = Product.includes(:images).order('created_at DESC')
  end

  def new
    @product = Product.new
    @product.images.new
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

  def show
  end

  def destroy
    flash.now[:alert] = '削除に失敗しました' unless @product.destroy  
  end

  # エラーページ用
  def not_found
  end

  # 購入確認ページへ遷移
  def purchase_check
    creditcard = Creditcard.where(user_id: current_user.id).last
    if creditcard.blank?
      redirect_to controller: "creditcards", action: "new"
    else
      Payjp.api_key = "sk_test_355455f8b6eacc16bf5f51c9"
      customer = Payjp::Customer.retrieve(creditcard.customer_id)
      @default_card_information = customer.cards.retrieve(creditcard.card_id)
    end
  end

  # 購入完了ページに遷移
  def purchase_completed
    creditcard = Creditcard.where(user_id: current_user.id).last
    Payjp.api_key = "sk_test_355455f8b6eacc16bf5f51c9"
    Payjp::Charge.create(
    :amount => 13500, #支払金額を入力（itemテーブル等に紐づけても良い）
    :customer => creditcard.customer_id, #顧客ID
    :currency => 'jpy', #日本円
    )
    @product.update(trading_status: 2)
    redirect_to action: 'done'
  
  end

  def done
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
