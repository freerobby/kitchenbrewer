require 'spec_helper'

describe Category do
  describe "validation" do
    describe "title" do
      it "is present" do
        lambda {
          Factory.create :category, :title => nil
        }.should raise_error ActiveRecord::RecordInvalid
        lambda {
          Factory.create :category, :title => ""
        }.should raise_error ActiveRecord::RecordInvalid
      end
      it "is unique" do
        Factory.create :category, :title => "title"
        lambda {
          Factory.create :category, :title => "title"
        }.should raise_error ActiveRecord::RecordInvalid
      end
    end
  end
end
