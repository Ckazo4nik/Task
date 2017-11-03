class AddDateToUser < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.remove :birthday
      t.date :birthday

    end
  end
end
