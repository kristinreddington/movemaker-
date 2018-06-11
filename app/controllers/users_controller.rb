class UsersController < ApplicationController

  def new
    if logged_in?
      redirect_to user_path(current_user)
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def show
    if logged_in?
      @user = User.find_by_id(:id => params[:id])
      @message = params[:message]
    else
      redirect_to root_path
  end
end

  def edit
  end

  def update
    @user = User.find_by(:id => params[:id])
    @user.update(user_params)
    @user.save
    redirect_to user_path(@user)
  end

  def destroy
    if current_user
      @user = User.find_by(:id => params[:id]).destroy
      redirect_to root_path
    end
  end

  def user_params
    params.require(:user).permit(:name, :password, :level, :admin)
  end
end
