class PagesController < ApplicationController
  def home
    @title = "Home"
    if signed_in?
      @nag = Nag.new 
      @feed_items = current_member.feed.paginate(:page => params[:page])
    end
  end

  def contact
    @title = "Contact"
  end

  def about
    @title = "About"
  end

  def help
    @title = "Help"
  end

  def nagSomeOne
    @nag = Nag.new 
     #@feed_items = current_member.feed.paginate(:page => params[:page])
    @members = Member.all
  end

   def viewNags
    @members = Member.all
    @nag = Nag.new 
     #@feed_items = current_member.feed.paginate(:page => params[:page])
    #@members = Member.all
  end

  def myNags
    if signed_in?
      @nag = Nag.new 
      @feed_items = current_member.feed.paginate(:page => params[:page])
      #render 'shared/feed'
    end  
  end

  def searchMembers
    @searchResult = search(params[:search])
  end

private
  def search(search)
    if search
      result = Member.find_by_email(search)
      if result
        result
      end
    end
  end

end
