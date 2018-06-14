class RemoveColumnsFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :uid
    remove_column :users, :screen_name
    remove_column :users, :oauth_token
    remove_column :users, :oauth_token_secret
  end
end
