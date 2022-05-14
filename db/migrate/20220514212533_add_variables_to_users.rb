class AddVariablesToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :full_name, :string
    add_column :users, :credits, :integer
    add_column :users, :job_title, :string
    add_column :users, :linkedin_url, :string
    add_column :users, :image_url, :string
  end
end
