class ChangeDateInFlaws < ActiveRecord::Migration
  def up
  	remove_column :flaws, :date
  	add_column :flaws, :date, :timestamp
  end

  def down
  	remove_column :flaws, :date
  	add_column :flaws, :date, :string
  end
end
