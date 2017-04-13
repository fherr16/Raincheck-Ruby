class AddDateToInvitations < ActiveRecord::Migration
  def change
    add_column :invites, :date, :string, default: ""
  end
end
