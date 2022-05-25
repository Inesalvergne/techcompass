class MigrateContenttoRichContentResources < ActiveRecord::Migration[6.1]
  def up
    Resource.find_each do |resource|
      resource.update(rich_content: resource.content)
    end
  end

  def down
    Resource.find_each do |resource|
      resource.update(content: resource.rich_content)
      resource.update(rich_content: nil)
    end
  end
end
