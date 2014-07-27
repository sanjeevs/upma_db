class AddCategoryToVerses < ActiveRecord::Migration
  def change
    add_column :verses, :category, :string, default: 'shloka'
  end
end
