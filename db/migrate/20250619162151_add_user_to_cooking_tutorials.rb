class AddUserToCookingTutorials < ActiveRecord::Migration[7.1]
  def change
    add_reference :cooking_tutorials, :user, null: false, foreign_key: true
  end
end
