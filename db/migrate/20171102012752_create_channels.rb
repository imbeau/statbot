class CreateChannels < ActiveRecord::Migration[5.1]
  def change
    create_table :channels do |t|
      t.string :name
      t.boolean :enabled, default: true
      t.references :organization, foreign_key: true 

      t.timestamps
    end
  end
end
