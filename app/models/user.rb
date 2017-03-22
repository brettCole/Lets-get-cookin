class User < ApplicationRecord
  has_secure_password
  has_many :recipes, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :ratings, dependent: :destroy
  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true

  #Create User with auth value from Twitter or Facebook
  def self.sign_in_with_auth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth['info']['name']
      user.email = auth['info']['email']
      user.password = SecureRandom.hex
    end
  end

  #Create New Session
  def self.create_session
    if params[:email] == '' || params[:password] == ''
      flash.now[:error] = "Email or Password Can Not Be Blank!"
      render :new
    elsif !self.find_by_email(params[:email])
      flash.now[:error] ="Email or Password Are Incorrect!"
      render :new
    else
      user = self.find_by_email(params[:email])
      user == user.authenticate(params[:password]) && user.provider.nil?
      session[:id] = user.id
      redirect_to user_path(user)
    end
  end

end
