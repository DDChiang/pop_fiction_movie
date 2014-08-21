class User < ActiveRecord::Base
  has_attached_file :photo
  validates :email, presence: true
  has_secure_password 
  #TODO go through these
  validates_attachment_content_type :photo, :content_type => /\Aimage/
  # Validate filename
  validates_attachment_file_name :photo, :matches => [/png\Z/, /jpe?g\Z/]
  # Explicitly do not validate
  do_not_validate_attachment_file_type :photo

  #TODO add more validations
end
