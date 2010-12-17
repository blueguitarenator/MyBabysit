class UsersController < ApplicationController
  before_filter :logged_in?
  
  # GET /users/search
  def search
    @user = current_user
    @search = User.search
    @search.first_name_like(params[:first_name_keywords]).last_name_like(params[:last_name_keywords]).email_like(params[:email_keywords])
    @users, @users_count = @search.all, @search.count
    render :results  
  end
  
  # GET /users/add_friend
  def add_friend
    friend = User.find(params[:id])
    current_user.add_friend(friend)
    redirect_to user_url(current_user)
  end
  
  # GET /users
  # GET /users.xml
  def index
    redirect_to user_url(current_user)
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = current_user
    invitation = Invitation.find_by_email(@user.email)
    if (invitation)
      friend = User.find(invitation.user_id)
      if (friend)
        current_user.add_friend(friend)
        invitation.destroy
        flash[:notice] = "You and User #{friend.first_name} #{friend.last_name} have been linked due to invitation"
      end
    end
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = current_user
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        flash[:notice] = "User #{@user.last_name} was registered successfully."
        format.html { redirect_to(root_url) }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = current_user

    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = "User #{@user.last_name} was successfully updated."
        format.html { redirect_to(:action => 'show') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
end
