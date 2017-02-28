class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.integer :bar_id
      t.string :bar_name
      t.text :contents
      t.date :date
      t.time :time
      t.string :location

      t.timestamps
    end
  end
end
