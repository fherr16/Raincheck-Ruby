class AddUserTypeToRainchecks < ActiveRecord::Migration
  def change
    add_column :rainchecks, :user_type, :integer, default: 0
  end
end
