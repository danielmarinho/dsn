class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :debate
  
  include Bootsy::Container
end
