class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.belongs_to :user, index: true
      t.belongs_to :stock, index: true
      t.boolean :above
      t.boolean :below
      t.integer :high
      t.integer :low

      t.timestamps
    end
  end
end
