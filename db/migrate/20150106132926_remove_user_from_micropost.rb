class RemoveUserFromMicropost < ActiveRecord::Migration
  def up
    remove_column :microposts, :user_id
  end

  def down
    add_column :microposts, :user_id, :integer
  end
end
