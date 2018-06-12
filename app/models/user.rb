class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true

  has_many :donations, dependent: :destroy

  def self.from_omniauth(info)
    where(uid: info[:uid]).first_or_create do |new_user|
      new_user.uid                = info.uid
      new_user.password           = SecureRandom.base64.tr('+/=', 'Qrt')
      new_user.first_name         = info.info.name
      new_user.email              = info.info.email
      new_user.oauth_token        = info.credentials.token
      new_user.oauth_token_secret = info.credentials.secret
    end
  end

  def update_with_oauth(info)
    update(uid:                info.uid)
    update(oauth_token:        info.credentials.token)
    update(oauth_token_secret: info.credentials.secret)
  end

  def total_donations
    donations.sum(:charge_amount)
  end
end
