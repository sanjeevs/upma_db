class AddUpanishadToMicroPosts < ActiveRecord::Migration
  def change
    add_column :microposts, :urn, :string
  end
end
