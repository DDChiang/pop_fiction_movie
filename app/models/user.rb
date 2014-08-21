class User < ActiveRecord::Base
  has_attached_file :photo
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, length: {minimum: 6}
  has_secure_password 
  #TODO go through these
  validates_attachment_content_type :photo, :content_type => /\Aimage/
  # Validate filename
  validates_attachment_file_name :photo, :matches => [/png\Z/, /jpe?g\Z/]
  # Explicitly do not validate
  do_not_validate_attachment_file_type :photo
  before_save { self.email = email.downcase }
  has_many :movies
  #TODO add more validations
end
