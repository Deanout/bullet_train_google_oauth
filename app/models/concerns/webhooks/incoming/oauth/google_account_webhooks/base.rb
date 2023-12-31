module Webhooks::Incoming::Oauth::GoogleAccountWebhooks::Base
  extend ActiveSupport::Concern

  included do
    include Webhooks::Incoming::Webhook

    belongs_to :oauth_google_account, class_name: "Oauth::GoogleAccount", optional: true
  end

  def process
    # if this is a google connect webhook ..
    if data["account"]

      # if we're able to find an account in our system that this webhook should be routed to ..
      if (self.oauth_google_account = Oauth::GoogleAccount.find_by(uid: data["account"]))

        # save the reference to the account.
        save

        # delegate processing to that account.
        oauth_google_account.process_webhook(self)

      end

      # if we didn't find an account for the webhook, they've probably deleted their account. we'll just ignore it for
      # now, but it's still in our database for debugging purposes. we'll probably want to send a request to google
      # in order to disconnect their account from our application so we stop receiving webhooks.

    else

      # it's possible we're receiving a general webhook that isn't specific to an account.
      # however, we want to know about these, so raise an error.
      raise "received a webhook we weren't expecting"

    end
  end
end
