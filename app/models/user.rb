class User < ActiveRecord::Base
  has_many :sightings
  has_many :birds, through: :sightings
  validates :username, presence: true
  validates :password, presence: true
  has_secure_password
end
