class RenamePieces < ActiveRecord::Migration[6.1]
  def change
    rename_column :pieces, :type, :category
  end
end
