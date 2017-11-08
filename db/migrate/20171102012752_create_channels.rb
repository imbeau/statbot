class CreateChannels < ActiveRecord::Migration[5.1]
  def change
    create_table :channels do |t|
      t.string :name
      t.integer :channel_id
      t.boolean :enabled

      t.timestamps
    end
  end
end
