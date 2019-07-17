class RemoveContactNumberFromCustomers < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :contact_number, :integer
  end
end
