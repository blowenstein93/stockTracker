class Stocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :ticker
      t.float :price
      t.string :company
      t.boolean :owned
      t.boolean :watching
      t.belongs_to :user, index: true

      t.timestamps
  end
  end
end
