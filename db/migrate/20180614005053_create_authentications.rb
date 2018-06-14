class CreateAuthentications < ActiveRecord::Migration[5.2]
  def change
    create_table :authentications do |t|
      t.references :user, foreign_key: true
      t.integer :provider
      t.text :uid
      t.text :oauth_token
      t.text :oauth_token_secret
    end
  end
end
