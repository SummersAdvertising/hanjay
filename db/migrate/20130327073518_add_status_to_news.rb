class AddStatusToNews < ActiveRecord::Migration
  def change
  	add_column :news, :status, :string
  end
end
