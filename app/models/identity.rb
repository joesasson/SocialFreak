class Identity < ApplicationRecord
  devise :omniauthable, :omniauth_providers => [:twitter, :github, :linkedin, :google]
  belongs_to :user
  validates_uniqueness_of :uid, :scope => :provider
  class << self
    def from_omniauth(auth_hash)
      unless identity = find_with_omniauth(auth_hash)
        identity = create_with_omniauth(auth_hash)
      end
      identity
    end

    def find_with_omniauth(auth_hash)
      Identity.find_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
    end

    def create_with_omniauth(auth_hash)
      if user = User.find_by_email(auth_hash['info']['email'])
        Identity.create(uid: auth_hash['uid'], provider: auth_hash['provider'], user: user)
      else
        user = User.create_from_omniauth(auth_hash)
        Identity.create(uid: auth_hash['uid'], provider: auth_hash['provider'], user: user)
      end
    end
  end
end
