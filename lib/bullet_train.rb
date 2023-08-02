# TODO This file is going away, but we need it temporarily for compatibility with the integration scaffolder.

def google_enabled?
  ENV['GOOGLE_CLIENT_ID'].present? && ENV['GOOGLE_CLIENT_SECRET'].present?
end

# 🚅 super scaffolding will insert new oauth providers above this line.

def any_oauth_enabled?
  [
    stripe_enabled?,
    google_enabled?,
    # 🚅 super scaffolding will insert new oauth provider checks above this line.
  ].select(&:present?).any?
end
