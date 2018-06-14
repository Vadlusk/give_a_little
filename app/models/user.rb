class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true

  has_many :donations, dependent: :destroy
  has_many :authentications, dependent: :destroy

  def self.from_omniauth(info)
    where(email: info[:info][:email]).first_or_create do |new_user|
      new_user.first_name         = info.info.name
      new_user.email              = info.info.email
      new_user.password           = SecureRandom.base64.tr('+/=', 'Qrt')
    end
  end

  def total_donations
    donations.sum(:charge_amount)
  end
end
