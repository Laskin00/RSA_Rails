class CreateRsas < ActiveRecord::Migration[5.1]
  def change
    create_table :rsas do |t|
      t.string :public_key
      t.string :private_key

      t.timestamps
    end
  end
end
