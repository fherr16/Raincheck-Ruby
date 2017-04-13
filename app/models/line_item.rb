class LineItem < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :raincheck
end
