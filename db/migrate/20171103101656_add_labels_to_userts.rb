class AddLabelsToUserts < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.string :full_name
      t.integer :birthday
      t.string :address
      t.string :city
      t.string :state
      t.string :country

    end
  end
end
