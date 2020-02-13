class CreateTenants < ActiveRecord::Migration[6.0]
  def change
    create_table :tenants do |t|
      t.string :renter
      t.string :co_renter
      t.string :address
      t.string :renter_email
      t.string :co_renter_email
      t.string :renter_cell_phone
      t.string :co_renter_cell_phone

      t.timestamps
    end
  end
end
