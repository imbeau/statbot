class AddOrganizationSnapshots < ActiveRecord::Migration[5.1]
  def change
  	  create_table :organization_snapshots do |t|
        t.integer :total_product_count
        t.integer :total_products_published
        t.integer :catalog_count
        t.integer :total_users
        t.integer :total_digital_assets
        t.references :organization, foreign_key: true
        t.timestamps
      end
  end
end
