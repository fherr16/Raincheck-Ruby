class AddTimeToInvitations < ActiveRecord::Migration
  def change
    add_column :invites, :time, :string, default: ""
  end
end
