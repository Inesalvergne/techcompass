class AddDefaultCreditsToUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :credits, :integer, default: 5
  end
end
