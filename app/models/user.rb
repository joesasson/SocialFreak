class User < ApplicationRecord
  has_many :identities
  validates :email, uniqueness: true
  class << self
    def create_from_omniauth(auth_hash)
      user = User.new
      user.name = auth_hash['info']['name']
      user.email = auth_hash['info']['email']
      user.location = get_social_location_for(auth_hash['provider'], auth_hash['info']['location'])
      user.image_url = auth_hash['info']['image']
      user.save
      user
    end

    private

    def get_social_location_for(provider, location_hash)
      case provider
        when 'linkedin'
          location_hash['name']
        else
          location_hash
      end
    end

    def get_social_url_for(provider, urls_hash)
      case provider
        when 'linkedin'
          urls_hash['public_profile']
        when 'github'
          urls_hash['GitHub']
        else
          urls_hash[provider.capitalize]
      end
    end
  end
end
