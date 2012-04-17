class NagsController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]
  before_filter :authorized_member, :only => :destroy

    def create
    @nag  = current_member.nags.build(params[:nag])       
    if @nag.save
      flash[:success] = "Nag created!"
      redirect_to root_path
    else
      @feed_items = []
      render 'pages/home'
    end
  end

  def destroy
    @nag.destroy
    redirect_back_or root_path
  end

  private

    def authorized_member
      @nag = current_member.nags.find_by_id(params[:id])
      redirect_to root_path if @nag.nil?
    end
end