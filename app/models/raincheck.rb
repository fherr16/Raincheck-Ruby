class Raincheck < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  belongs_to :user
  
  def check(restaurant_id, raincheck_id, hype)
    current_restaurant = line_items.find_by(restaurant_id: restaurant_id, raincheck_id: raincheck_id, hype_level: hype)
    if current_restaurant
      return 1
    else
      current_restaurant = line_items.build(restaurant_id: restaurant_id, raincheck_id: raincheck_id, hype_level: hype)
    end
    current_restaurant
  end
end
