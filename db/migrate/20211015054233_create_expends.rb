class CreateExpends < ActiveRecord::Migration[5.1]
  def change
    create_table :expends do |t|
      t.references :user, foreign_key: true
      t.references :saving, foreign_key: true  
      t.date :expend_date
      t.string :group
      t.integer :expend_amount
      t.string :memo
      t.timestamps
    end
  end
end
