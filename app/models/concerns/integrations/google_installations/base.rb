module Integrations::GoogleInstallations::Base
  extend ActiveSupport::Concern
  # 🚅 add concerns above.

  included do
    belongs_to :team
    belongs_to :oauth_google_account, class_name: "Oauth::GoogleAccount"
    # 🚅 add belongs_to associations above.

    # 🚅 add has_many associations above.

    # 🚅 add has_one associations above.

    # 🚅 add scopes above.

    validates :name, presence: true
    # 🚅 add validations above.

    # 🚅 add callbacks above.

    # 🚅 add delegations above.
  end

  # 🚅 add methods above.
end
