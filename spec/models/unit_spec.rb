require 'spec_helper'

describe Unit do
  describe "validation" do
    describe "title" do
      it "is present" do
        lambda {
          Factory.create :unit, :title => nil
        }.should raise_error ActiveRecord::RecordInvalid
        lambda {
          Factory.create :unit, :title => ""
        }.should raise_error ActiveRecord::RecordInvalid
      end
      it "is unique" do
        Factory.create :unit, :title => "title", :abbreviation => "abbr"
        lambda {
          Factory.create :unit, :title => "title", :abbreviation => "abbr2"
        }.should raise_error ActiveRecord::RecordInvalid
      end
    end
    describe "abbreviation" do
      it "is present" do
        lambda {
          Factory.create :unit, :abbreviation => nil
        }.should raise_error ActiveRecord::RecordInvalid
      end
      it "is unique" do
        Factory.create :unit, :title => "title", :abbreviation => "abbr"
        lambda {
          Factory.create :unit, :title => "title2", :abbreviation => "abbr"
        }.should raise_error ActiveRecord::RecordInvalid
      end
    end
  end
end
