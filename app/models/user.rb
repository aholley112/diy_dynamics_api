class User < ApplicationRecord
    has_secure_password
    has_one_attached :image
    has_many :comments
    has_many :likes
  has_many :liked_projects, through: :likes, source: :project


    # Validations

    validates :username, presence: true, uniqueness:{ case_sensitive: false }, length: { minimum: 3, maximum: 30 }
    validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 5, maximum: 255 }, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :first_name, presence: true
    validates :last_name, presence: true
    
  # Associations

  has_one :profile, dependent: :destroy
  has_many :projects
  after_create :create_user_profile
  has_many :favorites
  has_many :favorite_projects, through: :favorites, source: :project

  private

  def create_user_profile
    Profile.create(user: self)
  end
 
end