class RemoveCustomersIdFromAddresses < ActiveRecord::Migration[6.1]
  def change
    remove_column :addresses, :customers_id, :integer
  end
end
