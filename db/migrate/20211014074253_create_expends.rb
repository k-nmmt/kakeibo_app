class CreateExpends < ActiveRecord::Migration[5.1]
  def change
    create_table :expends do |t|
      t.string :group
      t.integer :expend_amount
      t.date :expend_date
      t.timestamps
      t.string :memo
    end
  end
end
