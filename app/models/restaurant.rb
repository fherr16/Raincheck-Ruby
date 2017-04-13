class Restaurant < ActiveRecord::Base
  has_many :line_items
  validates :name, presence:true
  before_destroy :ensures_not_referenced_by_any_line_item
  
  private
    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
        return true
      else
        errors.add(:base, 'Can no delete, Line Items present')
        return false
      end
    end
end
