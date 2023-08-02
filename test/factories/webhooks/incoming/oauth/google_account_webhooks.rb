FactoryBot.define do
  factory :webhooks_incoming_oauth_google_account_webhook, class: 'Webhooks::Incoming::Oauth::GoogleAccountWebhook' do
    data { "" }
    processed_at { "2023-08-02 02:12:00" }
    verified_at { "2023-08-02 02:12:00" }
    oauth_google_account { nil }
  end
end
