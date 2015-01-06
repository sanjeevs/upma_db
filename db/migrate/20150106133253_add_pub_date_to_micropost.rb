class AddPubDateToMicropost < ActiveRecord::Migration
  def change
    add_column :microposts, :author, :text
    add_column :microposts, :published_at, :datetime
  end
end
