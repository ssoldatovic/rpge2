class Power < ActiveRecord::Base
  
  mount_uploader :picture, PictureUploader
  
  belongs_to :user
  belongs_to :hero
  
  validates :name, :value, presence: true
  # validates :name, uniqueness: true
  validates :value, numericality: {greater_than_or_equal_to: 0}
  validates :picture, allow_blank: true, format: {
    with:    %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }
  
end
