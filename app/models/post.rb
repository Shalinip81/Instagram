class Post < ApplicationRecord
  has_many :comments
  belongs_to :user
  has_many :likes , dependent: :destroy

  validates :Description, presence:true
  has_one_attached :post_feed

end
