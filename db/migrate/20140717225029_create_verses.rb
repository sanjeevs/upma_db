class CreateVerses < ActiveRecord::Migration
  def change
    create_table :verses do |t|
      t.text :content
      t.text :english
      t.integer :index
      t.integer :upanishad_id

      t.timestamps
    end
    add_index :verses, [:upanishad_id, :index]
  end
end
