class User < ActiveRecord::Base
  has_many :sightings
  has_many :birds, through: :sightings
  has_secure_password
end
