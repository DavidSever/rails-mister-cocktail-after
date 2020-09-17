class RemoveIngredientIdFromDoses < ActiveRecord::Migration[6.0]
  def change
    remove_column :doses, :ingredient_id, :integer
  end
end
