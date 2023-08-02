FactoryBot.define do
  factory :oauth_google_account, class: "Oauth::GoogleAccount" do
    uid { "MyString" }
    data { "" }
    team { nil }
    user { nil }
  end
end
