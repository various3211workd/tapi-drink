class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :user_token

      t.timestamps
    end
    add_index :users, :user_token, unique: true
  end
end
