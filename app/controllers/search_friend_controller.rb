
class SearchFriendController < ApplicationController

  # GET /search_friend/new
  # GET /search_friend/new.xml
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /search_friend
  # GET /search_friend.xml
  def index
    @user = current_user
    @users = User.like(params[:search_keywords])
    render :show
  end
end