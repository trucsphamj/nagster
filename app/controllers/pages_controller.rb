class PagesController < ApplicationController
  def home
    @title = "Home"
    if signed_in?
      @nag = Nag.new 
      @feed_items = current_member.feed.paginate(:per_page => 5, :page => params[:page])
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

  def findNagSomeOne
    @nameArray = Array.new
    @members = Array.new
    name = params[:name]
    name.strip!
    members = Member.all
    members.each do |member|
      if member.name.downcase.include? name.downcase
        @nameArray << member.name
      end    
    end
    if @nameArray.count == 0
      flash[:error] = "Name not found. Try again!"
      redirect_to '/nagSomeOne'
    elsif @nameArray.count == 1
      @nag = Nag.new 
      @member = Member.find_by_name(@nameArray.first)
       render 'members/nagAMember'
    else
      @nameArray.each do |name|
        @members << Member.find_by_name(name)
      end
      render 'moreThanOneFound'
    end
  end

  def findShowSomeOne
    @nameArray = Array.new
    @members = Array.new
    name = params[:name]
    name.strip!
    members = Member.all
    members.each do |member|
      if member.name.downcase.include? name.downcase
        @nameArray << member.name
      end    
    end
    if @nameArray.count == 0
      flash[:error] = "Name not found. Try again!"
      redirect_to members_path
    else
      render 'showFoundMembers'
    end
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
      @feed_items = current_member.feed.paginate(:per_page => 5, :page => params[:page])
      #render 'shared/feed'
    end  
  end


end
