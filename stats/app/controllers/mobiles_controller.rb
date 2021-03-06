class MobilesController < ApplicationController
  # GET /mobiles
  # GET /mobiles.xml
  def index
    @mobiles = Mobile.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @mobiles }
    end
  end

  # GET /mobiles/1
  # GET /mobiles/1.xml
  def show
    @mobile = Mobile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @mobile }
    end
  end

  # GET /mobiles/new
  # GET /mobiles/new.xml
  def new
    @mobile = Mobile.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mobile }
    end
  end

  # GET /mobiles/1/edit
  def edit
    @mobile = Mobile.find(params[:id])
  end

  # POST /mobiles
  # POST /mobiles.xml
  def create
    @mobile = Mobile.new(params[:mobile])

    respond_to do |format|
      if @mobile.save
        format.html { redirect_to(@mobile, :notice => 'Mobile was successfully created.') }
        format.xml  { render :xml => @mobile, :status => :created, :location => @mobile }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mobile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /mobiles/1
  # PUT /mobiles/1.xml
  def update
    @mobile = Mobile.find(params[:id])

    respond_to do |format|
      if @mobile.update_attributes(params[:mobile])
        format.html { redirect_to(@mobile, :notice => 'Mobile was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mobile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /mobiles/1
  # DELETE /mobiles/1.xml
  def destroy
    @mobile = Mobile.find(params[:id])
    @mobile.destroy

    respond_to do |format|
      format.html { redirect_to(mobiles_url) }
      format.xml  { head :ok }
    end
  end
end
