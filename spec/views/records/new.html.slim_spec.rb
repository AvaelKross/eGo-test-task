require 'rails_helper'

RSpec.describe "records/new", :type => :view do
  before(:each) do
    assign(:record, Record.new(
      :owner_id => 1,
      :title => "MyString",
      :body => "MyText"
    ))
  end

  it "renders new record form" do
    render

    assert_select "form[action=?][method=?]", records_path, "post" do

      assert_select "input#record_owner_id[name=?]", "record[owner_id]"

      assert_select "input#record_title[name=?]", "record[title]"

      assert_select "textarea#record_body[name=?]", "record[body]"
    end
  end
end
