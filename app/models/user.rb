class User < ActiveRecord::Base
  belongs_to :assigments
  acts_as_authentic
  acts_as_authorization_subject  :association_name => :roles
end
