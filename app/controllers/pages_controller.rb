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
  end

  def backyard
    @title = "Backyard"
    @logo = "logo_awesome.png"
  end
  
  def admin
    @title = "Admin Controls"
    @logo = "logo_awesome.png"
  end
  
  def access_denied
    redirect_to login_path
  end

end
