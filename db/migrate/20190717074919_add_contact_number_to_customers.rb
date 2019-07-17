class AddContactNumberToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :contact_number, :bigint
  end
end
