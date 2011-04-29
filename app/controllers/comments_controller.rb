class CommentsController < ApplicationController
  rescue_from 'Acl9::AccessDenied', :with => :access_denied
  
  access_control do   
    allow :admin
  end
  
  def index
    @comments = Comment.all
  end
  
  def new
    @comment = Comment.new
  end
  
  def create
    @comment = Comment.new(params[:comment])
    respond_to do |format|
      if @comment.save
        format.html { redirect_to(:comments, :notice => 'Registration successfull.') }
        format.xml  { render :xml => @comment, :status => :created, :location => @comment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def edit
    @comment = Comment.find(params[:id])
  end
  
  def access_denied
    redirect_to backyard_path
  end
end
