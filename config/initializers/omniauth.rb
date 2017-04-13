OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1576954979297972', '4a599ae4328d9b1731b3ac83a8a5281b',
           :scope => 'public_profile, email, user_friends'
end