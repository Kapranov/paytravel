class AddPaymentToFlights < ActiveRecord::Migration
  def change
    add_column :flights, :payment, :boolean
  end
end
