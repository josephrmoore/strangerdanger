class PartsController < ApplicationController
  
  rescue_from 'Acl9::AccessDenied', :with => :access_denied
  
  access_control do   
    allow :admin
  end
  
  def index
    @parts = Part.all
  end
  
  def new
    @part = Part.new
  end
  
  def create
    @part = Part.new(params[:part])
    respond_to do |format|
      if @part.save
        format.html { redirect_to(:parts, :notice => 'Registration successfull.') }
        format.xml  { render :xml => @part, :status => :created, :location => @part }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @part.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def edit
    @part = Part.find(params[:id])
  end
  
  def access_denied
    redirect_to backyard_path
  end
  
end
