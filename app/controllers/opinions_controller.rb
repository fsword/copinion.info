class OpinionsController < ApplicationController

  before_filter :required_user,:only => [:create,:update]

  respond_to :html, :xml, :js
  
  # GET /opinions
  # GET /opinions.xml
  def index
    @opinions = Opinion.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @opinions }
    end
  end

  # GET /opinions/1
  # GET /opinions/1.xml
  def show
    @opinion = Opinion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @opinion }
    end
  end

  # GET /opinions/new
  # GET /opinions/new.xml
  def new
    @opinion = Opinion.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @opinion }
    end
  end

  # GET /opinions/1/edit
  def edit
    @opinion = Opinion.find(params[:id])
  end

  # POST /opinions
  # POST /opinions.xml
  def create
    @opinion = current_user.opinions.create(params[:opinion])
    respond_with(@opinion)
  end

  # PUT /opinions/1
  # PUT /opinions/1.xml
  def update
    @opinion = Opinion.find(params[:id])

    respond_to do |format|
      if @opinion.update_attributes(params[:opinion])
        format.html { redirect_to(@opinion, :notice => 'Opinion was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @opinion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /opinions/1
  # DELETE /opinions/1.xml
  def destroy
    @opinion = Opinion.find(params[:id])
    @opinion.destroy

    respond_to do |format|
      format.html { redirect_to(opinions_url) }
      format.xml  { head :ok }
    end
  end
end
