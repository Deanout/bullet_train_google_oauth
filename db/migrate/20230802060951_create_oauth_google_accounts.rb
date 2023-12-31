class CreateOauthGoogleAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :oauth_google_accounts do |t|
      t.string :uid
      t.jsonb :data
      t.references :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
