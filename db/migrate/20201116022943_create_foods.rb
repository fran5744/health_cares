class CreateFoods < ActiveRecord::Migration[5.1]
  def change
    create_table :foods do |t|
      t.string :f_name
      t.string :f_filename
      t.text :legend

      t.timestamps
    end
  end
end
