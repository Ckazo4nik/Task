class AddUserIdToAdverts < ActiveRecord::Migration[5.1]
  def change
    add_column :adverts, :user_id, :references
    add_index :adverts, :user_id
  end
end
