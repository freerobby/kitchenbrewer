require 'spec_helper'

describe Brewnote do
  before do
    @brew = Factory.create :brew
  end
  describe "validation" do
    it "requires brew" do
      lambda {
        Factory.create :brewnote, :brew => nil
      }.should raise_error ActiveRecord::RecordInvalid
    end
    it "requires body" do
      lambda {
        Factory.create :brewnote, :body => nil, :brew => @brew
      }.should raise_error ActiveRecord::RecordInvalid
    end
  end
  
  describe "recorded_at" do
    it "defaults to Time.now if null during validation" do 
      f = Factory.create :brewnote, :recorded_at => nil, :brew => @brew
      f.recorded_at.should be_close(f.created_at, 1.second)
    end
  end
end