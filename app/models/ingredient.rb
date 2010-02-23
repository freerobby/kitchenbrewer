class Ingredient < ActiveRecord::Base
  validates_presence_of :title
  validates_uniqueness_of :title
    
  belongs_to :default_unit, :class_name => "Unit"
  belongs_to :category
end
