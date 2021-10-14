class CreateIncomes < ActiveRecord::Migration[5.1]
  def change
    create_table :incomes do |t|
      t.integer :income_amount
      t.date :income_date
      t.timestamps
      t.string :memo
    end
  end
end
