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
  
  # GET /events/1/reply
  # GET /events/1/reply.xml
  def create
    puts "***************"
    event = Event.find(params[:event_id])
    friend = User.find(params[:id])
    not_found = true
    event.replies.each do |r|
      if friend.email == r.user.email
        not_found = false
      end
    end
    if (not_found)
      r = Reply.create(
        :event_id => event.id,
        :user_id => params[:id],
        :answer => '<NONE>',
        :note => ''
        )
      event.replies << r
      BabysitMailer.deliver_event(event, r)
    end
    redirect_to user_url(current_user)
  end
  
end
