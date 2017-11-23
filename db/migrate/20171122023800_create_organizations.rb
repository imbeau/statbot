class CreateOrganizations < ActiveRecord::Migration[5.1]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :system_id
      t.string :api_token
      t.timestamps      	
    end
  end
end
