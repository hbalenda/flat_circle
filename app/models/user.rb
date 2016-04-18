class User < ApplicationRecord
  before_create :generate_auth_token
  before_save { self.email = email.downcase }
  validates :name, length: { minimum: 3, maximum: 100}, presence: true
  validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
  validates :password, length: { minimum: 6 }, allow_blank: true
  validates :email,
    presence: true,
    uniqueness: { case_sensitive: false },
    length: { minimum: 3, maximum: 100 }
  has_secure_password

  def generate_auth_token
    loop do
      self.auth_token = SecureRandom.base64(64)
      break unless User.find_by(auth_token: auth_token)
    end
  end
end
