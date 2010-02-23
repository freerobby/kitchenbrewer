class Unit < ActiveRecord::Base
  validates_presence_of :title, :allow_nil => false
  validates_presence_of :abbreviation, :allow_nil => false
  validates_uniqueness_of :title
  validates_uniqueness_of :abbreviation
end
