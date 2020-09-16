class AddCocktailIdToDoses < ActiveRecord::Migration[6.0]
  def change
    add_column :doses, :cocktail_id, :integer
  end
end
