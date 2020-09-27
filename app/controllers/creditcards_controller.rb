class CreditcardsController < ApplicationController
  def index

  end

  def new
    @creditcard = Creditcard.new
  end
  
  def create
    @creditcard = Creditcard.new(creditcard_params)
    if @creditcard.save
      redirect_to root_path 
    else
      render :new
    end
  end

  private

  def creditcard_params
    params.permit(:card_id, :exp_year, :exp_month, :cvc).merge(user_id: current_user.id)
  end

end
