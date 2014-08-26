class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.integer :owner_id, limit: 8
      t.string :title, limit: 200
      t.text :body

      t.timestamps
    end
  end
end
