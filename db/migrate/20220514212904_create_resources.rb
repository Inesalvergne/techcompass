class CreateResources < ActiveRecord::Migration[6.1]
  def change
    create_table :resources do |t|
      t.references :user, null: false, foreign_key: true
      t.text :content
      t.string :title
      t.text :summary
      t.integer :votes
      t.string :level
      t.string :tags

      t.timestamps
    end
  end
end
