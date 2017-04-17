class User < ApplicationRecord
  has_secure_password
  has_many :recipes, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :ratings, dependent: :destroy

  validates :password, confirmation: true
  validates :name, :email, presence: true
  validates :email, uniqueness: true

  #Create User with auth value from Twitter or Facebook
  def self.sign_in_with_auth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth['info']['name']
      user.email = auth['info']['email']
      user.password = SecureRandom.hex
      user.save!
    end
  end

end
