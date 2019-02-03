class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :delete_all

  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :body, presence: true, length: { maximum: 2000 }
end
