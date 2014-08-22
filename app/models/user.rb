class User < ActiveRecord::Base
  has_attached_file :photo

  has_many :votes, :foreign_key => :voter_id
  has_many :voted_movies, :through => :votes, :source => :voted_movie

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: {minimum: 6}
  before_create :create_remember_token
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

  def User.new_remember_token
   SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def create_remember_token
    self.remember_token = User.digest(User.new_remember_token)
  end

end
