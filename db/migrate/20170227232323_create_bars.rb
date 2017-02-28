class CreateBars < ActiveRecord::Migration[5.0]
  def change
    create_table :bars do |t|
      t.string :bar_name
      t.string :location
      t.string :phone_number
      t.integer :user_id

      t.timestamps
    end
  end
end
