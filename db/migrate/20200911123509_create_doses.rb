class CreateDoses < ActiveRecord::Migration[6.0]
  def change
    create_table :doses do |t|
      t.string :description
      t.integer :cocktail_id
      t.integer :ingredient

      t.timestamps
    end
  end
end