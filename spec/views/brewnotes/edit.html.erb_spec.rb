require 'spec_helper'

describe "/brewnotes/edit.html.erb" do
  before do
    brew = Factory.create :brew
    brewnote = Factory.create :brewnote, :brew => brew
    assigns[:brewnote] = brewnote
  end

  it "renders the edit brew form" do
    render
    response.should have_tag("form[action=#{brewnote_path(assigns[:brewnote])}][method=post]")
    response.should have_tag("textarea[name=?]", "brewnote[body]")
    response.should have_tag("input[name=?]", "brewnote[gravity]")
    response.should have_tag("input[name=?]", "brewnote[recorded_at]")
  end
end
