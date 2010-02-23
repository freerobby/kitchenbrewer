require 'spec_helper'

describe Style do
  describe "validation" do
    describe "title" do
      it "is present" do
        lambda {
          Factory.create :style, :title => nil
        }.should raise_error ActiveRecord::RecordInvalid
        lambda {
          Factory.create :style, :title => ""
        }.should raise_error ActiveRecord::RecordInvalid
      end
      it "is unique" do
        Factory.create :style, :title => "title"
        lambda {
          Factory.create :style, :title => "title"
        }.should raise_error ActiveRecord::RecordInvalid
      end
    end
  end
end
