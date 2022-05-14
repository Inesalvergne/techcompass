class CreateGoals < ActiveRecord::Migration[6.1]
  def change
    create_table :goals do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :job_target
      t.text :description

      t.timestamps
    end
  end
end
