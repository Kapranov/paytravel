class AddSlugToFlights < ActiveRecord::Migration
  def change
    add_column :flights, :slug, :string
  end
end
