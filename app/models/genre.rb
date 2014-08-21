class Genre < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  before_save { self.name = name.downcase }
  has_and_belongs_to_many :movies
end
