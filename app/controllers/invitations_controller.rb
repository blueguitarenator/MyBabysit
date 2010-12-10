class InvitationsController < ApplicationController

  # GET /invitations/new
  # GET /invitations/new.xml
  def new
    puts "NEW"
    @invitation = Invitation.new
  end
  
  def update
    puts "UPDATE"
    BabysitMailer.deliver_invite(current_user, params[:invite_email])
    redirect_to user_url(current_user)
  end
  
end
