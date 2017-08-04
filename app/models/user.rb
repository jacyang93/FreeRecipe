class User < ApplicationRecord
  has_secure_password :validations => false
  has_many :authentications, dependent: :destroy
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :email, uniqueness: true

  def self.create_with_auth_and_hash(authentication, auth_hash)
    user = User.create!(name: auth_hash["extra"]["raw_info"]["name"], email: auth_hash["extra"]["raw_info"]["email"], password: SecureRandom.hex(10))
    user.authentications << authentication
    return user
  end

  # grab fb_token to access Facebook for user data
  def fb_token
    x = self.authentications.find_by(provider: 'facebook')
    return x.token unless x.nil?
  end

  def password_optional?
    true
  end

end
