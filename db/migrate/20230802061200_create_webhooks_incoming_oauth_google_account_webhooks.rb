class CreateWebhooksIncomingOauthGoogleAccountWebhooks < ActiveRecord::Migration[7.0]
  def change
    create_table :webhooks_incoming_oauth_google_account_webhooks do |t|
      t.jsonb :data
      t.datetime :processed_at
      t.datetime :verified_at
      t.references :oauth_google_account, null: true, foreign_key: true, index: {name: "index_stripe_webhooks_on_oauth_stripe_account_id"}

      t.timestamps
    end
  end
end
