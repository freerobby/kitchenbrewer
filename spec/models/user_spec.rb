require 'spec_helper'

describe User do
  it "should create a new instance given valid attributes" do
    Factory.create :user
  end
end
