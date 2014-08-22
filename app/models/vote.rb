class Vote < ActiveRecord::Base
  belongs_to :voted_movie, class_name: "Movie"
  belongs_to :voter, class_name: "User"
end
