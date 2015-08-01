class AddSlugToFlights < ActiveRecord::Migration
  def change
    add_column :flights, :slug, :string
    add_index :flights, :slug
  end
end
