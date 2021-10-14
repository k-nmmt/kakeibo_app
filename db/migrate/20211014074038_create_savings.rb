class CreateSavings < ActiveRecord::Migration[5.1]
  def change
    create_table :savings do |t|
      t.string :saving_name
      t.timestamps
      
    end
  end
end
