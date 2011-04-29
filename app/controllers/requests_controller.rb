class RequestsController < ApplicationController
  rescue_from 'Acl9::AccessDenied', :with => :access_denied
  
  access_control do   
    allow :admin
  end
  
  def index
    @requests = Request.all
  end
  
  def new
    @request = Request.new
  end
  
  def create
    @request = Request.new(params[:request])
    respond_to do |format|
      if @request.save
        format.html { redirect_to(:requests, :notice => 'Registration successfull.') }
        format.xml  { render :xml => @request, :status => :created, :location => @request }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @request.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def edit
    @request = Request.find(params[:id])
  end
  
  def access_denied
    redirect_to backyard_path
  end
end
