class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :profile_picture
  validates :bio, presence: true

end