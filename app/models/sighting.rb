class Sighting < ActiveRecord::Base
  belongs_to :user
  belongs_to :birds
end