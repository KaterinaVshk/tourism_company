require 'rails_helper'

RSpec.describe "tours/index", type: :view do
  before(:each) do
    assign(:tours, [
      Tour.create!(),
      Tour.create!()
    ])
  end

  it "renders a list of tours" do
    render
  end
end
