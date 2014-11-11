class AddCommentToVerses < ActiveRecord::Migration
  def change
    add_column :verses, :comment, :text
  end
end
