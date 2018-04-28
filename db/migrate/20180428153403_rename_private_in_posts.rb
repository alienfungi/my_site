class RenamePrivateInPosts < ActiveRecord::Migration[5.0]
  def change
    rename_column :posts, :private, :confidential
  end
end
