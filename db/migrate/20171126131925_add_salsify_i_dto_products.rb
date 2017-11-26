class AddSalsifyIDtoProducts < ActiveRecord::Migration[5.1]
  def change
  	    add_column :products, :salsify_id, :string
  end
end
