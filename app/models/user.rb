class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true

  has_many :donations

  def self.from_omniauth(auth_info)
    if user = User.find_by(email: auth_info.info.email)
      update_user(auth_info, user)
    end
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid                = auth_info.id
      new_user.password           = SecureRandom.base64.tr('+/=', 'Qrt')
      new_user.first_name         = auth_info.info.name
      new_user.email              = auth_info.info.email
      new_user.oauth_token        = auth_info.credentials.token
      new_user.oauth_token_secret = auth_info.credentials.secret
    end
  end

  def total_donations
    donations.sum(:charge_amount)
  end

  private

    def update_user(info, user)
      user.update(uid: info.id)
      user.update(oauth_token: info.credentials.token)
      user.update(oauth_token_secret: info.credentials.secret)
    end
end
