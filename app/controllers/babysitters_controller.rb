class BabysittersController < ApplicationController
  filter_parameter_logging :password, :password_confirmation
  
  # GET /babysitters
  # GET /babysitters.xml
  def index
    @babysitters = Babysitter.find(:all, :order => :last_name)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @babysitters }
    end
  end

  # GET /babysitters/1
  # GET /babysitters/1.xml
  def show
    @babysitter = Babysitter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @babysitter }
    end
  end

  # GET /babysitters/new
  # GET /babysitters/new.xml
  def new
    @babysitter = Babysitter.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @babysitter }
    end
  end

  # GET /babysitters/1/edit
  def edit
    @babysitter = current_user
  end

  # POST /babysitters
  # POST /babysitters.xml
  def create
    @babysitter = Babysitter.new(params[:babysitter])

    respond_to do |format|
      if @babysitter.save
        flash[:notice] = "Babysitter #{@babysitter.last_name} was successfully created."
        format.html { redirect_to(root_url) }
        format.xml  { render :xml => @babysitter, :status => :created, :location => @babysitter }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @babysitter.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /babysitters/1
  # PUT /babysitters/1.xml
  def update
    puts "==================================="
    logger.info("************ Updating user: " + current_user + " ********************")
    @babysitter = current_user

    respond_to do |format|
      if @babysitter.update_attributes(params[:babysitter])
        flash[:notice] = "Babysitter #{@babysitter.last_name} was successfully updated."
        format.html { redirect_to(:action => 'index') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @babysitter.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /babysitters/1
  # DELETE /babysitters/1.xml
  def destroy
    @babysitter = Babysitter.find(params[:id])
    @babysitter.destroy

    respond_to do |format|
      format.html { redirect_to(babysitters_url) }
      format.xml  { head :ok }
    end
  end
end
