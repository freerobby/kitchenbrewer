require 'spec_helper'

describe Recipe do
  describe "validation" do
    describe "title" do
      it "is present" do
        lambda {
          Factory.create :recipe, :title => nil
        }.should raise_error ActiveRecord::RecordInvalid
        lambda {
          Factory.create :recipe, :title => ""
        }.should raise_error ActiveRecord::RecordInvalid
      end
      it "is unique" do
        Factory.create :recipe, :title => "title"
        lambda {
          Factory.create :recipe, :title => "title"
        }.should raise_error ActiveRecord::RecordInvalid
      end
    end
    describe "volume_in_gallons" do
      it "is present" do
        lambda {
          Factory.create :recipe, :volume_in_gallons=> nil
        }.should raise_error ActiveRecord::RecordInvalid
      end
    end
    describe "style" do
      it "is present" do
        lambda {
          Factory.create :recipe, :style_id => nil
        }.should raise_error ActiveRecord::RecordInvalid
      end
    end
    describe "ibus" do
      it "is greater than or equal to 0" do
        lambda {
          Factory.create :recipe, :ibus => -1
        }.should raise_error ActiveRecord::RecordInvalid
        lambda {
          Factory.create :recipe, :ibus => 0
        }.should_not raise_error ActiveRecord::RecordInvalid
      end
    end
    describe "abv" do
      it "is greater than or equal to 0" do
        lambda {
          Factory.create :recipe, :abv => -1.5
        }.should raise_error ActiveRecord::RecordInvalid
        lambda {
          Factory.create :recipe, :abv => 0
        }.should_not raise_error ActiveRecord::RecordInvalid
      end
      it "is less than 100" do
        lambda {
          Factory.create :recipe, :abv => 100.1
        }.should raise_error ActiveRecord::RecordInvalid
        lambda {
          Factory.create :recipe, :abv => 100
        }.should raise_error ActiveRecord::RecordInvalid
      end
    end
    describe "srm" do
      it "is greater than or equal to 0" do
        lambda {
          Factory.create :recipe, :srm => -1
        }.should raise_error ActiveRecord::RecordInvalid
        lambda {
          Factory.create :recipe, :srm => 0
        }.should_not raise_error ActiveRecord::RecordInvalid
      end
    end
    describe "author" do
      it "is present" do
        lambda {
          Factory.create :recipe, :author => nil
        }.should raise_error ActiveRecord::RecordInvalid
      end
    end
    describe "brew_type" do
      it "is present" do
        lambda {
          Factory.create :recipe, :brew_type => nil
        }.should raise_error ActiveRecord::RecordInvalid
      end
    end
  end
  describe "instance methods" do
    before do
      @user = Factory.create :user
      s = Factory.create :style, :title => "Style"
      @recipe = Factory.create :recipe, :author => @user, :style => s, :brew_type => (Factory.create :brew_type)
    end
    describe "style_title=" do
      it "creates new style if title does not exist" do
        old_ct = Style.count
        @recipe.style_title = "new title"
        @recipe.save!
        Style.count.should == old_ct + 1
      end
      it "assigns style of given title to recipe" do
        s = Factory.create :style, :title => "my title"
        @recipe.style_title = "my title"
        @recipe.save!
        @recipe.reload.style.should == s
      end
    end
    describe "style_title" do
      it "returns the name of the style" do
        @recipe.style_title.should == "Style"
      end
    end
  end
end
