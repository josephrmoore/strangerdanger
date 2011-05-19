class AssignmentsController < ApplicationController
  
  rescue_from 'Acl9::AccessDenied', :with => :access_denied
  
  access_control do   
    allow :admin
  end
  
  def index
    @assignments = Assignment.all
  end
  
  def new
    @assignment = Assignment.new
    @songs = Song.all
    @parts = Part.all
    @users = User.all
  end
  
  def create
    @assignment = Assignment.new(params[:assignment])
    respond_to do |format|
      if @assignment.save
        format.html { redirect_to(:assignments, :notice => 'Registration successfull.') }
        format.xml  { render :xml => @assignment, :status => :created, :location => @assignment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @assignment.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def edit
    @assignment = Assignment.find(params[:id])
    @songs = Song.all
    @parts = Part.all
    @users = User.all
  end

  def update
    @assignment = Assignment.find(params[:id])
    @songs = Song.all
    @parts = Part.all
    @users = User.all

    respond_to do |format|
      if @assignment.update_attributes(params[:assignment])
        format.html { redirect_to(@assignment, :notice => 'Assignment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @assignment.errors, :status => :unprocessable_entity }
      end
    end
  end

  def show
    @assignment = Assignment.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @assignment }
    end
  end

  def destroy
    @assignment = Assignment.find(params[:id])
    @assignment.destroy

    respond_to do |format|
      format.html { redirect_to(:assignments) }
      format.xml  { head :ok }
    end
  end

  def access_denied
    redirect_to backyard_path
  end
  
end
