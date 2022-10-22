require 'rails_helper'

describe "the delete a review process", type: :feature do
  it "deletes a product review" do
    test_product = Product.create(name: 'pizza', cost: '4', country_of_origin: 'zimbabwe')
    test_review = Review.create(author: 'Ashe Catchem', content_body: 'ibferiougfreoiuergfoiuqehrg. foreughfoiqerhfg .oiwerhgfoieruhfg .', rating: 2, product_id: test_product.id)
    visit  product_review_path(test_product, test_review)
    click_on 'Delete review'
    expect(page).to have_content 'review successfully deleted!'
    expect(page).not_to have_content 'ibferiougfreoiuergfoiuqehrg.'
  end
end