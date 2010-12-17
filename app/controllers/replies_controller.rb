class RepliesController < ApplicationController

  # GET /replies/1
  # GET /replies/1.xml
  def show
    @user = current_user
    @reply = Reply.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @reply }
    end
  end

  # GET /replies/1/edit
  def edit
    @reply = current_user.replies.find(params[:id])
  end

  # PUT /replies/1
  # PUT /replies/1.xml
  def update
    @reply = current_user.replies.find(params[:id])
    if (@reply.update_attributes(params[:reply]))
      event = Event.find(@reply.event.id)
      BabysitMailer.deliver_reply(event, @reply)
      redirect_to user_url(current_user)
    else
      render :action => :edit
    end
  end
end
