require 'rails_helper'


describe "the add a product process" do
  it "adds a new product" do
    visit products_path
    click_button'Create new product'
    fill_in 'Name', :with => 'Giant Steps'
    fill_in 'Country of origin', :with => 'Jazz'
    fill_in 'Cost', :with => '5'
    click_on 'Create Product'
    expect(page).to have_content 'product successfully created!'
    expect(page).to have_content 'Giant Steps'
  end

  it "gives an error when no name is entered" do
    visit new_product_path
    click_on 'Create Product'
    expect(page).to have_content "Name can't be blank"
  end
end