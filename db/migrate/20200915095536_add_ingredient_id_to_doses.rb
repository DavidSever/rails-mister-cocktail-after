class AddIngredientIdToDoses < ActiveRecord::Migration[6.0]
  def change
    add_column :doses, :ingredient_id, :integer
  end
end
