class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.string  :firstName,       null: false
      t.string  :lastName,        null: false
      t.decimal :sum,             null: false, precision: 12, scale: 3
      t.boolean :percent,         null: false
      t.decimal :commission,      null: false, precision: 12, scale: 3
      t.decimal :totalAmount,     null: false, precision: 12, scale: 3
      t.string  :email,           null: false
      t.integer :telephone,       null: false

      t.timestamps null: false
    end
  end
end
