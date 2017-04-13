class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.integer :response
      t.integer :line_item_id

      t.timestamps null: false
    end
  end
end
