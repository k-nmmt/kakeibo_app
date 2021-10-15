class CreateIncomes < ActiveRecord::Migration[5.1]
  def change
    create_table :incomes do |t|
      t.references :user, foreign_key: true
      t.references :saving, foreign_key: true
      t.integer :income_amount
      t.date :income_date
      t.string :memo
      t.timestamps
    end
  end
end
