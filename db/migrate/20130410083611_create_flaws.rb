class CreateFlaws < ActiveRecord::Migration
  def change
    create_table :flaws do |t|
      t.text :issue
      t.string :date
      t.string :status

      t.timestamps
    end
  end
end
