class AddMasterToAdmin < ActiveRecord::Migration
  def change
  	add_column :admins, :master, :boolean
  end
end
