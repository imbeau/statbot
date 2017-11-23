class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.timestamps
      t.references :channel, foreign_key: true
    end
  end
end
