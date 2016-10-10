class SessionController < ApplicationController

  def new
    # This is the action for user login. The view will have the login form template.
  end

  def create
    user = User.find_by :email => params[:email]
      if user.present? && user.authenticate(params[:password])
        session[:user_id] = user.id
        flash[:notice] = "User created!"
        redirect_to root_path
      else
        flash[:error] = "User could not be created!"
        redirect_to login_path
      end
  end

  def destroy
      session[:user_id] = nil
      redirect_to login_path
  end


end
