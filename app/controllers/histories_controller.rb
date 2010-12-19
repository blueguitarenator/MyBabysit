class HistoriesController < ApplicationController
  
  # GET /histories
  # GET /histories.xml
  def index
    @user = current_user
    if @user.accttype != 'babysitter'
      @historic_events = @user.events.historic(Time.now)
    end
    if @user.accttype != 'parent'
      @historic_replies = @user.replies.historic(Time.now)
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @histories }
    end
  end

end