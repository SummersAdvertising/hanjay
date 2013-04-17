class CreateNewsphotos < ActiveRecord::Migration
  def change
    create_table :newsphotos do |t|
      t.string :image
      t.integer :news_id
      t.string :name

      t.timestamps
    end
  end
end
