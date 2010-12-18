class EventsController < ApplicationController

  def add_reply
    @event = Event.find(params[:evt_id])
    r = Reply.create(
      :event_id => @event.id,
      :user_id => params[:id],
      :answer => '<NONE>',
      :note => ''
      )
    @event.replies << r
    BabysitMailer.deliver_event(@event, r)
    redirect_to user_url(current_user)
  end

  # GET /events/1
  # GET /events/1.xml
  def show
    @user = current_user
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/new
  # GET /events/new.xml
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/1/edit
  def edit
    @user = current_user
    @event = current_user.events.find(params[:id])
  end

  # POST /events
  # POST /events.xml
  def create
    @event = Event.new(params[:event])
    if (current_user.events << @event)
      redirect_to user_url(current_user)
    else
      render :action => :new
    end
  end

  # PUT /events/1
  # PUT /events/1.xml
  def update
    @user = current_user
    @event = current_user.events.find(params[:id])
    if (@event.update_attributes(params[:event]))
      redirect_to user_url(current_user)
    else
      render :action => :edit
    end
  end
end
