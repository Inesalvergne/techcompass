class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.references :goal, null: false, foreign_key: true
      t.string :company
      t.text :description
      t.string :location
      t.string :role
      t.string :level
      t.string :post_url
      t.string :status
      t.date :interview_date
      t.boolean :remote

      t.timestamps
    end
  end
end
