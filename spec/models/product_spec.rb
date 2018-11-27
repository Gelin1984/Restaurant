require 'rails_helper'

describe Product do

 context 'when the product has comments' do

	let(:product) { Product.create!(name: "Awesome Website", description: "Buy that", price: "30") }
	let(:user) { User.create!(email: "monkey@gmail.com",first_name: "User", last_name: "random",admin: false, password: "blablabla") }

	before do
  product.comments.create!(rating: 1, user: user, body: "Disgusting website!")
  product.comments.create!(rating: 3, user: user, body: "Not bad actually")
  product.comments.create!(rating: 5, user: user, body: "A piece of art!")
end

  it "returns the average rating of all comments" do
  expect(product.average_rating).to eq 3
end

        it "is not valid without a name" do
      expect(Product.new(description: "Cool bike")).not_to be_valid
    end
  end

end