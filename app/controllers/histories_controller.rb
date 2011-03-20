class HistoriesController < ApplicationController
  
  # GET /histories
  # GET /histories.xml
  def index
    @user = current_user
    @historic_events = @user.events.historic(Time.now)
    @historic_replies = @user.replies.historic(Time.now)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @histories }
    end
  end

end