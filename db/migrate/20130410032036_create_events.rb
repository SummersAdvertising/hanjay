class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.timestamp :date
      t.string :period
      t.string :location
      t.text :description
      t.string :status
      t.string :link

      t.timestamps
    end
  end
end
