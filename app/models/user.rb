class User < ActiveRecord::Base
  has_secure_password
  before_save { self.email = email.downcase }
  validates :username, presence: true, length:{maximum: 25}, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false}
  validates :password, presence: true, length: {minimum: 6}
end
