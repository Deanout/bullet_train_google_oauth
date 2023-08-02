class CreateIntegrationsGoogleInstallations < ActiveRecord::Migration[7.0]
  def change
    create_table :integrations_google_installations do |t|
      t.references :team, null: false, foreign_key: true
      t.references :oauth_google_account, null: false, foreign_key: true, index: {name: "index_google_installations_on_oauth_google_account_id"}
      t.string :name

      t.timestamps
    end
  end
end
