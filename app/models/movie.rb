class Movie < ActiveRecord::Base
  has_attached_file :poster, :default_url => "missing.png"
 
  has_many :votes, :foreign_key => :voted_movie_id
  has_many :voters, :through => :votes, :source => :voter

  validates_attachment :poster,
    size:  { in: 0..10.megabytes },
    :content_type => { :content_type => /^image\/(jpeg|png|gif|tiff)$/ }
  validates :name, presence: true
  belongs_to :user
  has_and_belongs_to_many :genres
end
