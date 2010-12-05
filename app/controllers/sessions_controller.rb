class SessionsController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy
  
  def new
    puts "HELLLLLLLLLLPPPPPPPPPPPPPP"
    @session = Session.new
  end
  
  def create
    logger.info("Created a new session")
    @session = Session.new(params[:session])
    if @session.save
      flash[:notice] = "Login successful!"
#      route = current_user.kind_of?(Parent) ? parent_url(current_user.id) : babysitter_url(current_user.id)
      redirect_back_or_default user_url(current_user.id)
    else
      render :action => :new
    end
  end
  
  def destroy
    current_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_back_or_default login_url
  end

 end
