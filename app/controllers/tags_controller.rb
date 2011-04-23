class TagsController < ApplicationController

  # GET /opinions/1
  # GET /opinions/1.xml
  def show
    @tag = Tag.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @opinion }
    end
  end
  
end
