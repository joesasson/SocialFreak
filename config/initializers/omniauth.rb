# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
#   provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET'], scope: "user,user:email"
#   provider :linkedin, ENV['LINKEDIN_KEY'], ENV['LINKEDIN_SECRET'],
#     scope: 'r_basicprofile r_emailaddress',
#     fields: ['id', 'email-address', 'first-name', 'last-name', 'location', 'picture-url', 'public-profile-url']
#   provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_SECRET'],
#     scope: 'profile, email', image_aspect_ratio: 'square', image_size: 48, access_type: 'online', name: 'google'
# end
#
# OmniAuth.config.on_failure = Proc.new do |env|
#   SessionsController.action(:auth_failure).call(env)
# end
