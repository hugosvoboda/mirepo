class CreateCostumers < ActiveRecord::Migration
  def change
    create_table :costumers do |t|
      t.string :name,		:null => false
      t.string :email,		:null => false
      t.integer :user_id,	:null => true

      t.timestamps
    end

    add_index :costumers, :email,		:unique => true
  end
end
