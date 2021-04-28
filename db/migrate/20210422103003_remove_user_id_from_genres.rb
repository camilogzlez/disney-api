class RemoveUserIdFromGenres < ActiveRecord::Migration[6.1]
  def change
    remove_column :genres, :user_id, :bigint
  end
end
