class CreateEncryptedMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :encrypted_messages do |t|
      t.string :encrypted_message
      t.integer :key_id

      t.timestamps
    end
  end
end
