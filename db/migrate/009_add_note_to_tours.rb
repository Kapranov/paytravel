class AddNoteToTours < ActiveRecord::Migration
  def change
    add_column :tours, :note, :text
  end
end
