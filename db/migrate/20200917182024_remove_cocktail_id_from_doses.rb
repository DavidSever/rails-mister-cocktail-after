class RemoveCocktailIdFromDoses < ActiveRecord::Migration[6.0]
  def change
    remove_column :doses, :cocktail_id, :integer
  end
end
