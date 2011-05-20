class UsersController < ApplicationController
  
  rescue_from 'Acl9::AccessDenied', :with => :access_denied
  
  access_control do   
     allow :admin
     allow logged_in, :to=> [:index, :show, :edit]
  end
  
  # GET /users
  # GET /users.xml
  def index
    @users = User.all
    @assignments = Assignment.all
    @songs = Song.all
    @parts = Part.all
    @comments = Comment.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])
    @assignments = Assignment.all
    @parts = Part.all
    @songs = Song.all
    @comments = Comment.all
    @usercomments = []
    @comments.each do |usercomment|
      if usercomment.user_id == @user.id
        @usercomments << usercomment
      end
    end
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    if (!current_user.has_role?("admin") && @user.id != current_user.id)
      redirect_to backyard_path
    end
  end

  # POST /users
  # POST /users.xml
  def create
      @user = User.new(params[:user])

      respond_to do |format|
        if @user.save
          format.html { redirect_to(:users, :notice => 'Registration successfull.') }
          format.xml  { render :xml => @user, :status => :created, :location => @user }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
        end
      end
    end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @comments = Comment.all
    for comment in @comments
      if comment.user_id == @user.id
        comment.destroy
      end
    end
    @assignments = Assignment.all
    for assignment in @assignments
      if assignment.user_id == @user.id
        assignment.destroy
      end
    end
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(admin_path) }
      format.xml  { head :ok }
    end
  end
  
  def access_denied
    redirect_to backyard_path
  end
  
end
