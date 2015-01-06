class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.string :content
      t.string :title
      t.string :tweets
      t.string :tag
      t.string :verse
      t.string :translation

      t.timestamps
    end
  end
end
