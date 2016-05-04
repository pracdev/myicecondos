class Landing < ActiveRecord::Base
  has_attached_file :bg_image, :default_url => "http://icecondos2.s3.amazonaws.com/default_bg.jpg"
  validates_attachment_content_type :bg_image, :content_type => /\Aimage\/.*\Z/
end
