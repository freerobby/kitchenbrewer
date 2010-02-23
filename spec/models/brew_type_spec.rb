require 'spec_helper'

describe BrewType do
  describe "validation" do
    describe "title" do
      it "is present" do
        lambda {
          Factory.create :brew_type, :title => nil
        }.should raise_error ActiveRecord::RecordInvalid
        lambda {
          Factory.create :brew_type, :title => ""
        }.should raise_error ActiveRecord::RecordInvalid
      end
      it "is unique" do
        Factory.create :brew_type, :title => "title"
        lambda {
          Factory.create :brew_type, :title => "title"
        }.should raise_error ActiveRecord::RecordInvalid
      end
    end
  end
end
