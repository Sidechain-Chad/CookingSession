class CreateCookingTutorials < ActiveRecord::Migration[7.1]
  def change
    create_table :cooking_tutorials do |t|
      t.string :title
      t.text :description
      t.string :location
      t.datetime :date
      
      t.timestamps
    end
  end
end
