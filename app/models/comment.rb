class Comment < ActiveRecord::Base
  has_one :user
  has_one :song
end
