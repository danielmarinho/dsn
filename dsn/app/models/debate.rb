class Debate < ActiveRecord::Base
  belongs_to :user
  has_many :posts
  
  has_attached_file :picture,styles: { normal: "1080x800>", thumb: "703×469#"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
  
end
