require 'spec_helper'

describe "/users/show.html.erb" do
  include UsersHelper
  before(:each) do
    assigns[:user] = @user = stub_model(User)
  end

  it "shows user's public profile" do
    render
    
    response.should include_text "Public profiles are not supported yet."
  end
end
