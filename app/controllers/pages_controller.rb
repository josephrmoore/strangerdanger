class PagesController < ApplicationController
  def home
    @title = "Home"
    @logo = "logo_large.png"
  end

  def backyard
    @title = "Backyard"
    @logo = "logo_awesome.png"
  end

end
