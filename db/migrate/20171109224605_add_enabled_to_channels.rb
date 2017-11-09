class AddEnabledToChannels < ActiveRecord::Migration[5.1]
  def change
  	change_column_default :channels, :enabled, true
  end
end
