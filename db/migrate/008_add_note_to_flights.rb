class AddNoteToFlights < ActiveRecord::Migration
  def change
    add_column :flights, :note, :text
  end
end
