class AddColumnFood < ActiveRecord::Migration[5.1]
  def change

    add_column :foods, :f_type, :string

  end
end
