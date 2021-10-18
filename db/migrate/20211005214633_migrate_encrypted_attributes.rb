class MigrateEncryptedAttributes < ActiveRecord::Migration[7.0]
  def change
    add_column :api_tokens, :access_token, :string

    ApiToken.reset_column_information

    ApiToken.find_each do |api_token|
      api_token.update!(access_token: decrypted_attribute(:encrypted_access_token, api_token))
    end
  end

  def decrypted_attribute(attribute_name, record)
    value = record.send(attribute_name)
    return if value.blank?

    value = Base64.decode64(value)

    cipher = OpenSSL::Cipher.new("aes-256-gcm")
    cipher.decrypt

    cipher.key = Rails.application.credentials.encryption_key
    cipher.iv = Base64.decode64(record.send(:"#{attribute_name}_iv"))

    cipher.auth_tag = value[-16..]
    cipher.auth_data = ""

    cipher.update(value[0..-17]) + cipher.final
  end
end
