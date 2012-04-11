class SessionsController < ApplicationController
  def new
    #render new.html.erb automatically (app/views/sessions/new.html.erb)
  end

  def create
    member = Member.authenticate(params[:session][:email],
                             params[:session][:password]) 
    if member.nil?
      flash.now[:error] = "Invalid email/password combination."
      @title = "Sign in"
      render 'new' # (render app/views/sessions/new.html.erb)
    else
      sign_in member #(this method located in app/helpers/sessions_helper.rb)
      redirect_back_or member #(this method located in app/helpers/sessions_helper.rb)
    end
  end

  def destroy
    sign_out #(this method located in app/helpers/sessions_helper.rb)
    redirect_to root_path
  end

end
