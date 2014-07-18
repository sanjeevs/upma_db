class RenameIndexToPosition < ActiveRecord::Migration
  def up
    rename_column :verses, :index, :position
  end

  def down
    rename_column :verses, :position, :index
  end
end
