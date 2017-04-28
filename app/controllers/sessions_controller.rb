class SessionsController < ApplicationController

  def new
    unless logged_in?

    else
      flash[:warning] = "You are already logged in!"
      redirect_to root_path
    end
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_back_or user
      flash[:success] = "Welcome back, #{user.name}!"
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
    flash[:success] = "Be back soon!"
  end
end
