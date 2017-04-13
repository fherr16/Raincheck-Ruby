class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :user_id
      t.string :content
      t.boolean :status

      t.timestamps null: false
    end
  end
end
