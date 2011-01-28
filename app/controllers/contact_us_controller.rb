class ContactUsController < ApplicationController
  
  # GET /histories
  # GET /histories.xml
  def index
    @user = current_user
    
  end

end