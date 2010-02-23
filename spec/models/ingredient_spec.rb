require 'spec_helper'

describe Ingredient do
  describe "validation" do
    describe "title" do
      it "is present" do
        lambda {
          Factory.create :ingredient, :title => nil
        }.should raise_error ActiveRecord::RecordInvalid
        lambda {
          Factory.create :ingredient, :title => ""
        }.should raise_error ActiveRecord::RecordInvalid
      end
      it "is unique" do
        Factory.create :ingredient, :title => "title"
        lambda {
          Factory.create :ingredient, :title => "title"
        }.should raise_error ActiveRecord::RecordInvalid
      end
    end
  end
end
