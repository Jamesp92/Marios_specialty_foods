require 'rails_helper'

describe 'the add a product review path', type: :feature do
  it 'adds a product review through the product page' do
  
    test_product = Product.create(name: 'pizza', cost: '4', country_of_origin: 'zimbabwe')
    visit product_path(test_product)
    click_on 'Add a review for this product'
    fill_in 'Author', with: 'Ashe catchem'
    fill_in 'Rating', with: '5'
    fill_in 'Content body', with: 'this was delicious. ad;fbha;ofhbg;adjkbnvijdnv;jkrkbnuie'
    click_on 'Create Review'
    expect(page).to have_content 'review successfully added!'
    expect(page).to have_content 'this was delicious.'
  end
  
  it "gives an error when no author is entered" do
    test_product = Product.create(name: 'pizza', cost: '4', country_of_origin: 'zimbabwe')
    visit new_product_review_path(test_product)
    click_on 'Create Review'
    expect(page).to have_content "Author can't be blank"
  end
end