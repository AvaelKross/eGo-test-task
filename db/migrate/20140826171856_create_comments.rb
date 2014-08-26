class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :owner_id, limit: 8
      t.integer :record_id, limit: 8
      t.text :body
      t.integer :parent_id, limit: 8

      t.timestamps
    end
  end
end
