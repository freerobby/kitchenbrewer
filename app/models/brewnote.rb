class Brewnote < ActiveRecord::Base
  belongs_to :brew
  
  validates_presence_of :brew
  validates_presence_of :body
  validates_presence_of :recorded_at
  validates_numericality_of :gravity, :allow_nil => true
  
  before_validation :set_recorded_at_if_unset
  after_save :update_brew_if_applicable
  
  default_scope :order => "recorded_at ASC"
  
  private
  def set_recorded_at_if_unset
    self.recorded_at = Time.now if self.recorded_at.nil?
  end
  
  def update_brew_if_applicable
    if self.brew.actual_original_gravity.nil? && !self.gravity.nil?
      self.brew.update_attribute(:actual_original_gravity, self.gravity)
    end
  end
end