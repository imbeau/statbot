class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :product_id
      t.datetime :last_seen

      t.timestamps
    end
  end
end
