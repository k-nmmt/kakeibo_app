class CreateExpends < ActiveRecord::Migration[5.1]
  def change
    create_table :expends do |t|
      t.date :expend_date
     t.references :saving, foreign_key: true
     t.string :group
     t.integer :expend_amount
      t.timestamps
      t.string :memo
    end
  end
end
