class CreditcardsController < ApplicationController
  require 'payjp'

  def index
  end

  def new
    if current_user.creditcards.present?
      redirect_to creditcard_path(current_user.creditcards[0].id)
    end
    creditcard = Creditcard.where(user_id: current_user.id)
  end

  def create
    # api秘密鍵を呼び出す Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
    Payjp.api_key = "sk_test_355455f8b6eacc16bf5f51c9"
    if params["payjp_token"].blank?
      redirect_to action: "new", alert: "クレジットカードを登録できませんでした"
    else
      customer = Payjp::Customer.create(
        card: params["payjp_token"],
      )
      @creditcard = Creditcard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @creditcard.save
        redirect_to creditcard_path(@creditcard.id)
      else
        redirect_to action: "new"
      end
    end
  end

  def destroy
    creditcard = Creditcard.where(user_id: current_user.id).last
    if creditcard.present?
      Payjp.api_key = "sk_test_355455f8b6eacc16bf5f51c9"
      customer = Payjp::Customer.retrieve(creditcard.customer_id)
      customer.delete
      creditcard.delete
    end
      redirect_to root_path
    # creditcard = Creditcard.where(user_id: current_user.id).first
    # if creditcard.blank?
    #   redirect_to action: "new"
    # else
    #   Payjp.api_key = "sk_test_355455f8b6eacc16bf5f51c9"
    #   customer = Payjp::Customer.retrieve(creditcard.customer_id)
    #   customer.delete
    #   creditcard.delete
    # end
    #   redirect_to root_path
  end

  def show #cardのデータpayjpに送り情報を取り出す
    creditcard = Creditcard.where(user_id: current_user.id).last
    if creditcard.present?
      Payjp.api_key = "sk_test_355455f8b6eacc16bf5f51c9"
      customer = Payjp::Customer.retrieve(creditcard.customer_id)
      @default_card_information = customer.cards.retrieve(creditcard.card_id)
    end
    # creditcard = Creditcard.where(user_id: current_user.id).first
    # if creditcard.blank?
    #   redirect_to action: "new"
    # else
    #   Payjp.api_key = "sk_test_355455f8b6eacc16bf5f51c9"
    #   #PAYJPに登録されている顧客情報をとってくる
    #   customer = Payjp::Customer.retrieve(creditcard.customer_id)
    #   @default_card_information = customer.cards.retrieve(creditcard.card_id)
    # end
  end

  def edit
  end

  def update
    @creditcard = Creditcard.find(params[:id])
    if @creditcard.update(creditcard_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def creditcard_params
    params.permit(:card_id, :exp_month, :exp_year, :cvc).merge(user_id: current_user.id)
  end

end