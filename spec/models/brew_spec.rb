require 'spec_helper'

describe Brew do
  describe "validation" do
    it "requires recipe title" do
      lambda {
        Factory.create :brew, :recipe_title => nil
      }.should raise_error ActiveRecord::RecordInvalid
      lambda {
        Factory.create :brew, :recipe_title => ""
      }.should raise_error ActiveRecord::RecordInvalid
    end
  end
  
  describe "began_at" do
    it "defaults to created_at if not specified" do
      brew = Factory.create :brew, :began_at => nil, :created_at => Time.zone.now.at_beginning_of_day
      brew.reload
      brew.began_at.should == Time.zone.now.at_beginning_of_day
    end
  end
  
  describe "#intended_alcohol_by_volume" do
    it "returns nil if og or fg is missing" do
      brew = Factory.create :brew, :intended_original_gravity => 1.050, :intended_final_gravity => nil
      brew.intended_alcohol_by_volume.should be_nil
      brew = Factory.create :brew, :intended_original_gravity => nil, :intended_final_gravity => 1.012
      brew.intended_alcohol_by_volume.should be_nil
    end
    it "returns correct calculation if og and fg are present" do
      brew = Factory.create :brew, :intended_original_gravity => 1.050, :intended_final_gravity => 1.012
      brew.intended_alcohol_by_volume.should == 4.978
    end
  end
  
  describe "#actual_alcohol_by_volume" do
    it "returns nil if og or fg is missing" do
      brew = Factory.create :brew, :actual_original_gravity => 1.050, :actual_final_gravity => nil
      brew.actual_alcohol_by_volume.should be_nil
      brew = Factory.create :brew, :actual_original_gravity => nil, :actual_final_gravity => 1.012
      brew.actual_alcohol_by_volume.should be_nil
    end
    it "returns correct calculation if og and fg are present" do
      brew = Factory.create :brew, :actual_original_gravity => 1.050, :actual_final_gravity => 1.012
      brew.actual_alcohol_by_volume.should == 4.978
    end
  end
  
  describe "#title" do
    describe "with recipe_title, only" do
      before do
        @brew = Factory.build :brew, :recipe_title => "Recipe Title", :created_at => Date.new(2009, 2, 3)
      end
      it "renders correctly" do
        @brew.title.should == "Recipe Title"
      end
    end
    describe "with recipe_title and began_at" do
      before do
        @brew = Factory.build :brew, :recipe_title => "Recipe Title", :began_at => Date.new(2009, 2, 3)
      end
      it "renders correctly" do
        @brew.title.should == "Recipe Title, began 02/03/2009"
      end
    end
    describe "with recipe_title, began_at, completed_at" do
      before do
        @brew = Factory.build :brew, :recipe_title => "Recipe Title", :began_at => Date.new(2009, 2, 3), :completed_at => Date.new(2009, 3, 7)
      end
      it "renders correctly" do
        @brew.title.should == "Recipe Title, 02/03/2009 - 03/07/2009"
      end
    end
  end
end
