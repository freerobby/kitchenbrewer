class Recipe < ActiveRecord::Base
  belongs_to :tweak_of, :class_name => "Recipe"
  belongs_to :style
  belongs_to :author, :class_name => "User"
  belongs_to :brew_type
  
  validates_uniqueness_of :title
  validates_presence_of :title
  validates_presence_of :volume_in_gallons
  validates_presence_of :style
  validates_presence_of :author
  validates_presence_of :brew_type
  validates_numericality_of :ibus, :greater_than_or_equal_to => 0, :allow_nil => true
  validates_numericality_of :abv, :greater_than_or_equal_to => 0, :less_than => 100, :allow_nil => true
  validates_numericality_of :srm, :greater_than_or_equal_to => 0, :allow_nil => true
  
  has_many :recipe_ingredients
  accepts_nested_attributes_for :recipe_ingredients, :allow_destroy => true, :reject_if => proc { |attributes| attributes.any? {|k,v| v.blank?} }
  
  def style_title
    style.title if style
  end
  def style_title=(title)
    self.style = Style.find_or_create_by_title(title) unless title.blank?
  end
end
