class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :location
      t.string :address
      t.datetime :hours

      t.timestamps
    end
  end
end
