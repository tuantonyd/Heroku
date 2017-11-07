class AddActiveToCustomers < ActiveRecord::Migration[5.1]
  def change
    add_column :customers, :active, :boolean
  end
end
