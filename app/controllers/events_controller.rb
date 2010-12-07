class EventsController < ApplicationController

  # GET /events
  # GET /events.xml
  def index
    # delete this
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @events }
    end
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
    @event = current_user.events.find(params[:id])
    if (@event.update_attributes(params[:event]))
      redirect_to user_url(current_user)
    else
      render :action => :edit
    end
  end

  # DELETE /events/1
  # DELETE /events/1.xml
  def destroy
    event = current_user.events.find(params[:id])
    current_user.events.delete(event)
    redirect_to user_url(current_user)
  end
end
