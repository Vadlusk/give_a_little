class CreateDonations < ActiveRecord::Migration[5.2]
  def change
    create_table :donations do |t|
      t.references :user, foreign_key: true
      t.string :panda_id
      t.string :charity_ein
      t.integer :charge_amount

      t.timestamps
    end
  end
end
