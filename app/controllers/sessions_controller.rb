class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # login and redirect to show page
    else
      flash.now[:danger] = "Oops, looks like a typo! This email/password combo is invalid"
      render 'new'
    end
  end

  def destroy
  end

end
