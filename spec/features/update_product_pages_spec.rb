require 'rails_helper'

describe "the update a product process", type: :feature do
  it "updates a product" do
    test_product = Product.create(name: 'pizza', cost: '4', country_of_origin: 'zimbabwe')
    visit product_path(test_product)
    click_on 'Edit product'
    fill_in 'Name', with: 'tacos'
    fill_in 'Cost', with: '90'
    fill_in 'Country of origin', with: 'russia'
    click_on 'Update Product'
    expect(page).to have_content 'product successfully updated!'
    expect(page).to have_content 'Tacos'
  end
end
  

