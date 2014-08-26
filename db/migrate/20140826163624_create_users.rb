class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login, limit: 20
      t.string :name

      t.timestamps
    end
  end
end
