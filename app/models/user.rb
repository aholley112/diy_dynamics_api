class User < ApplicationRecord
    has_secure_password
    has_one_attached :image

    # Validations

    validates :username, presence: true, uniqueness:{ case_sensitive: false }, length: { minimum: 3, maximum: 30 }
    validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 5, maximum: 255 }, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :first_name, presence: true
    validates :last_name, presence: true
    
  # Associations

  has_one :profile, dependent: :destroy
  has_many :projects
 
end