class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :street
      t.string :route
      t.string :local
      t.string :admin
      t.string :country
      t.string :postal

      t.timestamps null: false
    end
  end
end
