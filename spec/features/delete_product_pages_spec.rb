require 'rails_helper'

describe "the delete a product process", type: :feature do
  it "deletes a product" do
    test_product = Product.create(name: 'pizza', cost: '4', country_of_origin: 'zimbabwe')
    visit product_path(test_product)
    click_on 'Delete product'
    expect(page).to have_content 'product successfully deleted!'
    expect(page).not_to have_content 'pizza'
  end
end