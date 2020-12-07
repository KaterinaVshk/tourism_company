require 'rails_helper'

RSpec.describe "tours/edit", type: :view do
  before(:each) do
    @tour = assign(:tour, Tour.create!())
  end

  it "renders the edit tour form" do
    render

    assert_select "form[action=?][method=?]", tour_path(@tour), "post" do
    end
  end
end
