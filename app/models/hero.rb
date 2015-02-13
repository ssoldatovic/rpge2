class Hero < ActiveRecord::Base
  
  mount_uploader :picture, PictureUploader
  
  belongs_to :user
  has_many :powers
  
  validates :name, :picture, presence: true
  validates :name, uniqueness: true
  validates :picture, allow_blank: true, format: {
    with:    %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }
  
end
