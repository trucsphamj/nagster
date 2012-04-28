class MembersController < ApplicationController
  before_filter :authenticate, :only => [:show, :index, :edit, :update]
  before_filter :correct_member, :only => [:edit, :update]
  before_filter :admin_member,   :only => :destroy
  

  def index
    @title = "All members"
    #@members = Member.all 
    @members = Member.paginate(:per_page => 5, :page => params[:page])
  end

  def show
    @member = Member.find(params[:id])
    @nags = @member.nags.paginate(:per_page => 5, :page => params[:page])
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

  def edit
    #@member = Member.find(params[:id])
    @title = "Edit member"
  end

  def update
    #@member = Member.find(params[:id])
    if @member.update_attributes(params[:member])
      flash[:success] = "Profile updated."
      redirect_to @member
    else
      @title = "Edit member"
      render 'edit'
    end
  end

  def destroy
    Member.find(params[:id]).destroy
    flash[:success] = "Member destroyed."   
    redirect_to members_path
  end

  def nagAMember
    @nag = Nag.new
    @memberID = params[:id]
  end

  private
    #(This method has been moved to app/helpers/session_helper.rb)
    #def authenticate 
      #deny_access unless signed_in?
   # end

    def correct_member    
      @member = Member.find(params[:id])
      #(curent_member? method located in app/helpers/sessions_helper.rb)
      redirect_to(root_path) unless current_member?(@member) 
    end

    def admin_member
      redirect_to(root_path) unless current_member.admin?   
    end
end
