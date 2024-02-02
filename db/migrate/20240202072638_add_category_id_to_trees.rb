class AddCategoryIdToTrees < ActiveRecord::Migration[6.0]
  def change
    add_reference :trees, :category, foreign_key: { to_table: :categories, optional: true }
  end
end
