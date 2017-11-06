class AddSummaryToAdverts < ActiveRecord::Migration[5.1]
  def change
    add_column :adverts, :summary, :string
  end
end
