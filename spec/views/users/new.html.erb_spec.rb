require 'spec_helper'

describe "/users/new.html.erb" do
  include UsersHelper

  before(:each) do
    assigns[:user] = stub_model(User, :new_record? => true)
  end

  it "renders new user form" do
    render

    response.should have_tag("form[action=?][method=post]", users_path)
    response.should have_tag("input[name=?]", "user[email]")
    response.should have_tag("input[name=?]", "user[password]")
    response.should have_tag("input[name=?]", "user[password_confirmation]")
  end
end
