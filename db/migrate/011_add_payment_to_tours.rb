class AddPaymentToTours < ActiveRecord::Migration
  def change
    add_column :tours, :payment, :boolean
  end
end
