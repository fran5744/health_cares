class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
      t.string :user_id
      t.integer :weight
      t.integer :height
      t.string :ex_type_1
      t.string :ex_time_1
      t.integer :ex_amount_1
      t.string :ex_type_2
      t.string :ex_time_2
      t.integer :ex_amount_2
      t.string :ex_type_3
      t.string :ex_time_3
      t.integer :ex_amount_3
      t.boolean :meal_asa
      t.boolean :meal_hiru
      t.boolean :meal_ban
      t.boolean :snack
      t.text :snack_memo
      t.integer :condition
      t.date :day
      t.text :memo

      t.timestamps
    end
  end
end
