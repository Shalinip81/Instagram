class User < ApplicationRecord
  # has_one_attached :avatar
  validates :name, presence: true
  validates :email, uniqueness: true
  validates :phone_number, uniqueness: true ,length: { is: 10}
  validates :username, uniqueness: true
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  enum :account_type, [:Private, :Public]

  # validates_attachment :profile_picture, presence: true, size: { less_than: 2.megabytes }
  # validate :avatar_format

  # private
  #   def avatar_format
  #     byebug
  #       if avatar.blob.byte_size > 2.megabytes
  #         errors.add(:avatar, 'size needs to be less than 2MB')
  #         avatar.purge
  #       else
  #         resize_image
  #       end
  #   end
end
