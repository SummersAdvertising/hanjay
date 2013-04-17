class AddNewcreateToNews < ActiveRecord::Migration
  def change
  	add_column :news, :newcreate, :boolean
  end
end
