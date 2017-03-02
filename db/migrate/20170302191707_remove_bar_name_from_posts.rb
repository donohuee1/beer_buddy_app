class RemoveBarNameFromPosts < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts, :bar_name, :string
  end
end
