class SongsController < ApplicationController
  
  rescue_from 'Acl9::AccessDenied', :with => :access_denied
  
  access_control do   
    allow :admin
    allow logged_in, :to=> [:index]
  end
  
  def index
    @songs = Song.all
  end
  
  def new
    @song = Song.new
  end
  
  def create
    @song = Song.new(params[:song])
    respond_to do |format|
      if @song.save
        format.html { redirect_to(:songs, :notice => 'Registration successfull.') }
        format.xml  { render :xml => @song, :status => :created, :location => @song }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @song.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def edit
    @song = Song.find(params[:id])
  end
  
  def destroy
  end
  
  def showall
  end
  
  def getparts
  end
  
  def getusers
  end
  
  def addpart
  end
  
  def removepart
  end
  
  def editpart
  end
  
  def filteractive
  end
  
  def filterrecorded
  end
  
  def getcurrent
  end
  
  def access_denied
    redirect_to backyard_path
  end
  
end
