class Movie < ActiveRecord::Base
  has_attached_file :poster, :default_url => "missing.png"
  validates_attachment :poster,
    size:  { in: 0..10.megabytes },
    :content_type => { :content_type => /^image\/(jpeg|png|gif|tiff)$/ }
  validates :name, presence: true
  belongs_to :user
  has_many_and_belongs_to :genres
end
