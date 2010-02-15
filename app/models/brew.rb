class Brew < ActiveRecord::Base
  belongs_to :user
  has_many :brewnotes, :dependent => :destroy
  
  validates_presence_of :recipe_title
  validates_numericality_of :intended_original_gravity, :allow_nil => true
  validates_numericality_of :intended_final_gravity, :allow_nil => true
  validates_numericality_of :actual_original_gravity, :allow_nil => true
  validates_numericality_of :actual_final_gravity, :allow_nil => true
  
  after_create :guess_began_at_if_unspecified
  
  def intended_alcohol_by_volume
    (intended_original_gravity.nil? || intended_final_gravity.nil?) ? nil : (intended_original_gravity - intended_final_gravity) * 131.0
  end
  def actual_alcohol_by_volume
    (actual_original_gravity.nil? || actual_final_gravity.nil?) ? nil : (actual_original_gravity - actual_final_gravity) * 131.0
  end
  
  def title
    if self.began_at.nil? && self.completed_at.nil?
      "#{self.recipe_title}"
    elsif self.completed_at.nil?
      "#{self.recipe_title}, began " + began_at.strftime("%m/%d/%Y")
    else
      "#{self.recipe_title}, " + began_at.strftime("%m/%d/%Y") + " - " + completed_at.strftime("%m/%d/%Y")
    end
  end
  
  private
  def guess_began_at_if_unspecified
    self.update_attribute(:began_at, self.created_at) if self.began_at.blank?
  end
end