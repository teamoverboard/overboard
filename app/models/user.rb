class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [ :github ]

  def self.from_omniauth(auth)
    where( auth.slice(:provider, :uid).to_hash ).first_or_create! do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end.tap do |user|
      user.update_attributes(:name => auth.info.name, :email => auth.info.email)
    end
  end
end
