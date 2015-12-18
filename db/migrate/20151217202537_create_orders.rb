class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :is_fulfilled
      t.references :food, index: true, foreign_key: true
      t.references :party, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
