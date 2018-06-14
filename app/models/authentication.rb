class Authentication < ApplicationRecord
  belongs_to :user
  enum provider: %w[twitter google_oauth2]

  def self.from_oauth(info, user)
    where(provider: info[:provider]).first_or_create do |new_auth|
      new_auth.user               = user
      new_auth.provider           = info.provider
      new_auth.uid                = info.uid
      new_auth.oauth_token        = info.credentials.token
      new_auth.oauth_token_secret = info.credentials.secret
    end
  end
end
