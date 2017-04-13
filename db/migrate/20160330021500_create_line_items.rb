class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.references :restaurant, index: true, foreign_key: true
      t.belongs_to :raincheck, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
