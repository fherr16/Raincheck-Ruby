class AddHypeLevelToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :hype_level, :integer, default: 0
  end
end
