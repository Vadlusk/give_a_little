class Donation < ApplicationRecord
  belongs_to :user

  def self.from_data(data)
    where(panda_id: data[:panda_id]).first_or_create do |new_donation|
      new_donation.user_id       = User.find_by(email: data[:receipt_email])
      new_donation.panda_id      = data[:id]
      new_donation.charity_ein   = data[:destination]
      new_donation.charge_amount = data[:charge_amount].to_i
    end
  end
end
