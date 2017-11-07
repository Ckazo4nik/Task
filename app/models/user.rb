class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:omniauthable, :omniauth_providers => [:facebook]
  validates :username, :city, :full_name, :state, :country, presence: true
  validates :email, uniqueness: true
  has_many :adverts
  has_many :authorizations
  has_many :comments
  geocoded_by :full_street_address
  after_create :geocode

  def self.find_for_oauth(auth)
    authorization = Authorization.where(provider: auth.provider, uid: auth.uid.to_s).first
    return authorization.user if authorization


    email = auth.info[:email]
    user = User.where(email: email).first
    if user
      user.create_authorization(auth)
    else
      password = Devise.friendly_token[0, 20]
      user = User.create!(email: email, password: password, password_confirmation: password, full_name: auth.info[:name], username: email.match(/[a-z]*\@/)[0][0..-2], city: none, state: none, country: none,birthday: auth.info[:age_range])
      user.create_authorization(auth)
    end
    user
  end

  def create_authorization(auth)
    self.authorizations.create(provider: auth.provider, uid: auth.uid)
  end

  def full_street_address
   user = User.last
    street = "#{user.country} #{user.state} #{user.city} #{user.address}"
  end
end
