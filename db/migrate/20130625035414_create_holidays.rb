class CreateHolidays < ActiveRecord::Migration
  def change
    create_table :holidays do |t|
      t.string :description, 	:null => false
      t.date :date,				:null => false
      t.integer :user_id,		:null => true

      t.timestamps
    end

    add_index :holidays, :date,		:unique => true
  end
end
