class RemoveIngredientFromDoses < ActiveRecord::Migration[6.0]
  def change
    remove_column :doses, :cocktail_id, :integer
    remove_column :doses, :ingredient, :integer
  end
end
