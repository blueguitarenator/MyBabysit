class HistoriesController < ApplicationController
  
  # GET /histories
  # GET /histories.xml
  def index
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @histories }
    end
  end

end