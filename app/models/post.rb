class Post < ApplicationRecord
  has_many :comments
  belongs_to :user


  has_one_attached :post_feed
  validate :post_size_validation


  private
    def post_size_validation
        if post_feed.byte_size > 10.megabytes
          errors.add(:post_feed  , message: "file size should be less than 2 MB")
        end
    end
end
