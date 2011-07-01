class GaleriesController < ApplicationController

  before_filter :login_required
  
  # GET /galeries
  # GET /galeries.xml
  def index
    @galeries = Galery.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @galeries }
    end
  end

  # GET /galeries/1
  # GET /galeries/1.xml
  def show
    @galery = Galery.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @galery }
    end
  end

  # GET /galeries/new
  # GET /galeries/new.xml
  def new
    @galery = Galery.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @galery }
    end
  end

  # GET /galeries/1/edit
  def edit
    @galery = Galery.find(params[:id])
  end

  # POST /galeries
  # POST /galeries.xml
  def create
    @galery = Galery.new(params[:galery])

    respond_to do |format|
      if @galery.save
        format.html { redirect_to(@galery, :notice => 'Galery was successfully created.') }
        format.xml  { render :xml => @galery, :status => :created, :location => @galery }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @galery.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /galeries/1
  # PUT /galeries/1.xml
  def update
    @galery = Galery.find(params[:id])

    respond_to do |format|
      if @galery.update_attributes(params[:galery])
        format.html { redirect_to(@galery, :notice => 'Galery was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @galery.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /galeries/1
  # DELETE /galeries/1.xml
  def destroy
    @galery = Galery.find(params[:id])
    @galery.destroy

    respond_to do |format|
      format.html { redirect_to(galeries_url) }
      format.xml  { head :ok }
    end
  end
end
