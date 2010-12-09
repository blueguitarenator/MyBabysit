class RepliesController < ApplicationController
  # GET /replies
  # GET /replies.xml
  def index
    @replies = Reply.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @replies }
    end
  end

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

  # GET /replies/new
  # GET /replies/new.xml
  def new
    @reply = Reply.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @reply }
    end
  end

  # GET /replies/1/edit
  def edit
    @reply = current_user.replies.find(params[:id])
  end

  # POST /replies
  # POST /replies.xml
  def create
    @reply = Reply.new(params[:reply])
    if (current_user.replies << @reply)
      redirect_to user_url(current_user)
    else
      render :action => :new
    end
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

  # DELETE /replies/1
  # DELETE /replies/1.xml
  def destroy
    reply = current_user.replies.find(params[:id])
    current_user.replies.delete(reply)
    redirect_to user_url(current_user)
  end
end
