class SongsController < ApplicationController
  
  rescue_from 'Acl9::AccessDenied', :with => :access_denied
  
  access_control do   
    allow :admin
    allow logged_in, :to=> [:index]
  end
  
  def index
    @songs = Song.all
    @assignments = Assignment.all
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

  def update
    @song = Song.find(params[:id])

    respond_to do |format|
      if @song.update_attributes(params[:song])
        format.html { redirect_to(@song, :notice => 'Song was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @song.errors, :status => :unprocessable_entity }
      end
    end
  end

  def show
    @song = Song.find(params[:id])
    @assignments = Assignment.all
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @song }
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @comments = Comment.all
    for comment in @comments
      if comment.song_id == @song.id
        comment.destroy
      end
    end
    @assignments = Assignment.all
    for assignment in @assignments
      if assignment.song_id == @song.id
        assignment.destroy
      end
    end
    @song.destroy

    respond_to do |format|
      format.html { redirect_to(songs_url) }
      format.xml  { head :ok }
    end
  end

  def access_denied
    redirect_to backyard_path
  end
  
end
