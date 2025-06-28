class AddImageToCookingTutorials < ActiveRecord::Migration[7.1]
  def change
    add_column :cooking_tutorials, :image_url, :string
  end
end
