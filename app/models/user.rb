class User < ActiveRecord::Base
  has_attached_file :photo
  validates :first_name, length: {minimum: 2}, presence: true
  validates :last_name, length: {minimum: 1}, presence: true
  validates :pw, length: { minimum: 8}
  validates :nickname, uniqueness:true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, uniqueness: true, presence: true, format: { with: VALID_EMAIL_REGEX}
  VALID_PASS_REGEX_UPCase = /[A-Z]/i
  VALID_PASS_REGEX_DOWNCase = /[a-z]/i
  VALID_PASS_REGEX_NUM = /[0-9]/i
  VALID_PASS_REGEX_SPECIAL = /[!@#$&*]/i
  validates :pw, format: {with: VALID_PASS_REGEX_UPCase }, format: {with: VALID_PASS_REGEX_DOWNCase}
  validates :pw, format: {with: VALID_PASS_REGEX_NUM}, format: {with: VALID_PASS_REGEX_SPECIAL}
end
