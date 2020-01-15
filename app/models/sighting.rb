class Sighting < ActiveRecord::Base
  belongs_to :user
  belongs_to :bird
  validates :place, presence: true
  validates :time, presence: true
end
