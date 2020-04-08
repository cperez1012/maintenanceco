class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :provider
      t.integer :expires_at
      t.boolean :expires
      t.string :google_token
      t.string :google_refresh_token
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
