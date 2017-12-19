class CreateDecryptedMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :decrypted_messages do |t|
      t.string :decrypted_message

      t.timestamps
    end
  end
end
