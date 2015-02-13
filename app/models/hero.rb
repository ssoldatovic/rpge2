class Hero < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  belongs_to :user
  has_many :powers
end
