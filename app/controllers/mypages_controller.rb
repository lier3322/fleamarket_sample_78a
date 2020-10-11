class MypagesController < ApplicationController
  def show
    @user = User.where(user_id: current_user.id)
  end

  def index
  end
end