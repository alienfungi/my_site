class AddMetadataToTags < ActiveRecord::Migration
  def change
    enable_extension 'hstore'
    add_column :tags, :metadata, :hstore, default: '', null: false
    Tag.find_each do |tag|
      tag.updated_at = DateTime.now
      tag.save
    end
  end
end
