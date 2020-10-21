class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :user_id
      t.string :password_digest
      t.string :name
      t.integer :authority

      t.timestamps
    end
  end
end
