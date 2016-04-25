class Post < ActiveRecord::Base
  include Bootsy::Container#for the WYSIWYG editor to work
  belongs_to :user
  belongs_to :debate
end
