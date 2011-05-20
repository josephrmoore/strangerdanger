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
  
  def update
    @part = Part.find(params[:id])

    respond_to do |format|
      if @part.update_attributes(params[:part])
        format.html { redirect_to(@part, :notice => 'Part was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @part.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def show
    @part = Part.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @part }
    end
  end

  def destroy
    @part = Part.find(params[:id])
    @assignments = Assignment.all
    for assignment in @assignments
      if assignment.part_id == @part.id
        assignment.destroy
      end
    end
    @part.destroy

    respond_to do |format|
      format.html { redirect_to(parts_url) }
      format.xml  { head :ok }
    end
  end
  
  def access_denied
    redirect_to backyard_path
  end
  
end
