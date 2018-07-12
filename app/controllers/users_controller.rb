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
      redirect_to new_user_path, danger: "Please provide a unique name, email, secure password"
    end
  end

  def show
    if logged_in?
      @user = User.find_by(:id => params[:id])
      respond_to do |format|
        format.html { render :show }
        format.json { render json: @user }
      end
    else
      redirect_to root_path
  end
end

  def edit
    find_user
  end

  def update
    find_user
    @user.update(user_params)
    @user.save
    redirect_to user_path(@user)
  end

  def destroy
    if current_user
      find_user.destroy
      redirect_to root_path
    end
  end

  private

  def find_user
    @user = User.find_by(:id => params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :password, :level, :admin, :email)
  end
end
