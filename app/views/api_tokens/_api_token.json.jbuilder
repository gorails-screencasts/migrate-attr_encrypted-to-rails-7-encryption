json.extract! api_token, :id, :encrypted_access_token, :encrypted_access_token_iv, :created_at, :updated_at
json.url api_token_url(api_token, format: :json)
