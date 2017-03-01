class RemoveUserFromBars < ActiveRecord::Migration[5.0]
  def change
    remove_column :bars, :user_id, :string
  end
end
