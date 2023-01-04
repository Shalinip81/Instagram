# frozen_string_literal: true

class User < ApplicationRecord
  # starts here
  validates :name, presence: true
  validates :email, uniqueness: true
  validates :phone_number, uniqueness: true, length: { is: 10 }
  validates :username, uniqueness: true
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  enum :account_type, %i[Private Public]
  has_one_attached :profile_picture
  validate :avatar_size_validation

  # action mailer
  after_create :send_welcome_email
  after_update :send_update_email

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end
  def send_update_email
    UpdateMailer.upemail(self).deliver_now
  end


  has_many :followed_users,
           foreign_key: :follower_id,
           class_name: 'Relationship',
           dependent: :destroy

  has_many :followees , through: :followed_users , dependent: :destroy

  has_many :following_users,
           foreign_key: :followee_id,
           class_name: 'Relationship',
           dependent: :destroy

  has_many :followers , through: :following_users , dependent: :destroy

  has_many :posts


  private

  def avatar_size_validation
    return unless profile_picture.byte_size > 2.megabytes

    errors.add(:profile_picture, message: 'file size should be less than 2 MB')
  end
end
