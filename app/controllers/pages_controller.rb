class PagesController < ApplicationController
  
  rescue_from 'Acl9::AccessDenied', :with => :access_denied
  
  access_control do   
     allow :admin
     allow logged_in, :except => [:admin]
     allow anonymous, :to => [:home]
  end
  
  def home
    @title = "Home"
    @logo = "logo_large.png"
    @songs = Song.all
    @parts = Part.all
    @assignments = Assignment.all
  end

  def backyard
    @title = "Backyard"
    @logo = "logo_awesome.png"
  end
  
  def admin
    @title = "Admin Controls"
    @logo = "logo_awesome.png"
    @users = User.all
    @songs = Song.all
    @parts = Part.all
    @comments = Comment.all
    @assignments = Assignment.all
    @requests = Request.all
  end
  
  def access_denied
    redirect_to login_path
  end

end
