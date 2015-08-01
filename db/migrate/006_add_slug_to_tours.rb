class AddSlugToTours < ActiveRecord::Migration
  def change
    add_column :tours, :slug, :string
    add_index :tours, :slug
  end
end
