class SessionsController < ApplicationController
  def new
  end

  def create
    member = Member.authenticate(params[:session][:email],
                             params[:session][:password])
    if member.nil?
      flash.now[:error] = "Invalid email/password combination."
      @title = "Sign in"
      render 'new'
    else
      sign_in member
      redirect_to member
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

end
