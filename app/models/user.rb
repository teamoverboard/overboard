class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [ :github ]

  has_many :answers
  has_many :questions
  has_many :votes

  include Gravtastic
  gravtastic default: "identicon"

  def self.from_omniauth(auth)
    where( auth.slice(:provider, :uid).to_hash ).first_or_create! do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.username = auth.info.name.downcase.gsub(' ', '_')
    end.tap do |user|
      user.update_attributes(:name => auth.info.name, :email => auth.info.email)
    end
  end
end
