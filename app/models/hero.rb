class Hero < ActiveRecord::Base
  belongs_to :user
  has_many :powers
end
