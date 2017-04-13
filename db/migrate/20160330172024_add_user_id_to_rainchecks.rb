class AddUserIdToRainchecks < ActiveRecord::Migration
  def change
    add_column :rainchecks, :user_id, :integer, default: 1
  end
end
