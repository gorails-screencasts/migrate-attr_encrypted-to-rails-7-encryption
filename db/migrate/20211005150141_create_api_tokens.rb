class CreateApiTokens < ActiveRecord::Migration[7.0]
  def change
    create_table :api_tokens do |t|
      t.string :encrypted_access_token
      t.string :encrypted_access_token_iv

      t.timestamps
    end
  end
end
