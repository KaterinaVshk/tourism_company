require 'rails_helper'

RSpec.describe "tours/show", type: :view do
  before(:each) do
    @tour = assign(:tour, Tour.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
