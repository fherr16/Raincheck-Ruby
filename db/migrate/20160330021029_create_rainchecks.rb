class CreateRainchecks < ActiveRecord::Migration
  def change
    create_table :rainchecks do |t|

      t.timestamps null: false
    end
  end
end
