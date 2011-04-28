class Assignment < ActiveRecord::Base
has_one :song
has_one :user
has_one :part
end
