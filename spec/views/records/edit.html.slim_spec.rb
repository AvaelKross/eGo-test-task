require 'rails_helper'

RSpec.describe "records/edit", :type => :view do
  before(:each) do
    @record = assign(:record, Record.create!(
      :owner_id => 1,
      :title => "MyString",
      :body => "MyText"
    ))
  end

  it "renders the edit record form" do
    render

    assert_select "form[action=?][method=?]", record_path(@record), "post" do

      assert_select "input#record_owner_id[name=?]", "record[owner_id]"

      assert_select "input#record_title[name=?]", "record[title]"

      assert_select "textarea#record_body[name=?]", "record[body]"
    end
  end
end
