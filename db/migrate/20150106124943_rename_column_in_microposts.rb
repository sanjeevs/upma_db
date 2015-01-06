class RenameColumnInMicroposts < ActiveRecord::Migration
  def change
    rename_column :microposts, :tag, :tags
    rename_column :microposts, :tweets, :tweet
  end

end
