class RemoveRestaurantIdFromDishes < ActiveRecord::Migration[5.2]
  def change
    remove_column :dishes, :restaurant_id, :integer
  end
end
