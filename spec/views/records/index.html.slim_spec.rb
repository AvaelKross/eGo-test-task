require 'rails_helper'

RSpec.describe "records/index", :type => :view do
  before(:each) do
    assign(:records, [
      Record.create!(
        :owner_id => 1,
        :title => "Title",
        :body => "MyText"
      ),
      Record.create!(
        :owner_id => 1,
        :title => "Title",
        :body => "MyText"
      )
    ])
  end

  it "renders a list of records" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
