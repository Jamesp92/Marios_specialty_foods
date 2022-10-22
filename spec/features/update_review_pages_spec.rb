require 'rails_helper'

describe "the update a review process", type: :feature do
  it "updates a product review" do
 
    test_product = Product.create(name: 'pizza', cost: '4', country_of_origin: 'zimbabwe')
    test_review = Review.create(author: 'Ashe Catchem', content_body: 'so many words these are a lot of words words words words words', rating: 4, product_id: test_product.id)
    visit  product_review_path(test_product, test_review)
    click_on 'Edit review'
    fill_in 'Author', with: 'Misty'
    fill_in 'Content body', with: 'I wanna be the very best Like no one ever wasTo catch them is my real testTo train them is my causeI will travel across the lan Searching far and wide'
    fill_in 'Rating', with: 5
    click_on 'Update Review'
    expect(page).to have_content 'review successfully updated!'
    expect(page).to have_content 'Misty'
  end
end