class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @stock = Stock.where(user_id: params[:id])
  end

  def new
    @user = User.new
  end

def signin
  end

  def search
    user = User.where(email: params[:email]).first
    if user.nil?
      redirect_to root_path
    end
    redirect_to user_path(user.id)
  end

  def create
    @user = User.new(user_params)
    if @user.save
        redirect_to user_path(@user.id)
    else
        redirect_to root_path
    end
end

private

def user_params
    params.require(:user).permit(:email, :phone)
end


end
