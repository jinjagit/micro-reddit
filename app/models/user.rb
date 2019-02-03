class User < ApplicationRecord
  has_many :posts, dependent: :delete_all
  has_many :comments, dependent: :delete_all

  before_save { email.downcase! }
  validates :name, presence: true, length: { maximum: 16 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
end
