class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :title
      t.string :artist
      t.integer :length

      t.timestamps null: false
    end
  end
end
