require 'spec_helper'

describe "/users/edit.html.erb" do
  include UsersHelper

  before(:each) do
    assigns[:user] = @user = stub_model(User, :new_record? => false)
  end

  it "renders the edit user form" do
    render

    response.should have_tag("form[action=#{user_path(@user)}][method=post]")
    response.should have_tag("input[name=?]", "user[email]")
    response.should have_tag("input[name=?]", "user[password]")
    response.should have_tag("input[name=?]", "user[password_confirmation]")
  end
end
