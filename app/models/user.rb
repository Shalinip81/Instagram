class User < ApplicationRecord
  validates :name, presence: true
  validates :email, uniqueness: true
  validates :phone_number, uniqueness: true ,length: { is: 10}
  validates :username, uniqueness: true
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  enum :account_type, [:Private, :Public]

  has_one_attached :profile_picture
  validate :avatar_size_validation

  after_create :send_welcome_email

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end

  private

  def avatar_size_validation
    if profile_picture.byte_size > 2.megabytes
      errors.add(:profile_picture , message: "file size should be less than 2 MB")
    end
  end
end
