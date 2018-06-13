require 'pry'
class SessionsController < ApplicationController

  def new

    if logged_in?
      redirect_to user_path(current_user)
    else
    @user = User.new
  end
end

  def create
    if auth_hash = auth
      @user = User.find_or_create_by_omniauth(auth_hash)
      session[:user_id] = @user.id
      redirect_to signin_path
    else
      @user = User.find_by(:email => user_params[:email])
    if @user && @user.try(:authenticate, user_params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to signin_path, danger:  "Invalid email or password"
    end
  end
end

def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

    def user_params
      params.require(:user).permit(
        :name,
        :password,
        :email
      )
    end

    def auth
      request.env['omniauth.auth']
    end

end
