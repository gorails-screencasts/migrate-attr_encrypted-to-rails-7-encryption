class ApiToken < ApplicationRecord
  # attr_encrypted :access_token, key: Rails.application.credentials.encryption_key
  encrypts :access_token
end
