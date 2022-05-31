class ChangeDefaultCreditValurForUser < ActiveRecord::Migration[6.1]
  def change
    change_column_default :users, :credits, from: 5, to: 10
  end
end
