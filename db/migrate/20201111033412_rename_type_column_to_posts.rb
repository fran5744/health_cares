class RenameTypeColumnToPosts < ActiveRecord::Migration[5.1]
  def change

    rename_column :posts, :type, :movie_type

  end
end
