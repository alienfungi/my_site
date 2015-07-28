class AddSlugToTags < ActiveRecord::Migration
  def up
    add_column :tags, :slug, :string
    Tag.find_each { |tag| tag.save }
    change_column :tags, :slug, :string, null: false, uniqueness: true
  end

  def down
    remove_column :tags, :slug
  end
end
