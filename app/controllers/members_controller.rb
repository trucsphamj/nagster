class MembersController < ApplicationController
  def show
    @member = Member.find(params[:id])
    @title = @member.name
  end

  def new
    @member = Member.new  
    @title = "Sign up"   
  end

  def create
    @member = Member.new(params[:member])
    if @member.save
      sign_in @member 
      flash[:success] = "Welcome to Nagster!"
      redirect_to @member
    else
      @title = "Sign up"
      render 'new'
    end
  end  

end
