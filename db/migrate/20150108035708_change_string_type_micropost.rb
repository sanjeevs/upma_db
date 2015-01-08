class ChangeStringTypeMicropost < ActiveRecord::Migration
  def up
    change_column :microposts, :content, :text
    change_column :microposts, :tweet, :text
    change_column :microposts, :verse, :text
    change_column :microposts, :translation, :text
  end

  def down
    change_column :microposts, :content, :string
    change_column :microposts, :tweet, :string
    change_column :microposts, :verse, :string
    change_column :microposts, :translation, :string
  end
end
