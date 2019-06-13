class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to [:users], notice: 'User created!' #is this the right redirect?
    else
      render :new
    end
  end   
end
