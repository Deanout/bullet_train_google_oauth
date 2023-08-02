class Integrations::GoogleInstallation < ApplicationRecord
  include Integrations::GoogleInstallations::Base

  def process_webhook(webhook)
    raise "You should implement a `Integrations::GoogleInstallation` model in your application that has `include Integrations::GoogleInstallations::Base` and implements a `def process_webhook(webhook)` method."
  end
end
