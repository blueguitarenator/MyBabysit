class BabysittersController < ApplicationController
  # GET /babysitters
  # GET /babysitters.xml
  def index
    @babysitters = Babysitter.all

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
    @babysitter = Babysitter.find(params[:id])
  end

  # POST /babysitters
  # POST /babysitters.xml
  def create
    @babysitter = Babysitter.new(params[:babysitter])

    respond_to do |format|
      if @babysitter.save
        format.html { redirect_to(@babysitter, :notice => 'Babysitter was successfully created.') }
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
    @babysitter = Babysitter.find(params[:id])

    respond_to do |format|
      if @babysitter.update_attributes(params[:babysitter])
        format.html { redirect_to(@babysitter, :notice => 'Babysitter was successfully updated.') }
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
