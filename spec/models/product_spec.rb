require 'rails_helper'

describe Product do 
  it { should have_many(:reviews) }


it("titleizes the name of an product") do
  product = Product.create({name: "giant steps", country_of_origin: "jazz"})
  expect(product.name()).to(eq("Giant Steps"))
 end
end