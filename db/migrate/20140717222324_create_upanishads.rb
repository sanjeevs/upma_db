class CreateUpanishads < ActiveRecord::Migration
  def change
    create_table :upanishads do |t|
      t.string :name

      t.timestamps
    end
  end
end
