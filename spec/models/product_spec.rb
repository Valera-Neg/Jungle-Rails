require 'rails_helper'

# RSpec.describe Product, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

describe Product do

    subject {
      Product.new(
        name: "lobster",
        price_cents: 22000,
        quantity: 10,
        category_id: 1
      )
    }
    it "have a name" do
      expect(subject.name).to_not be_empty
    end
    

    it "have a price" do
      expect(subject.price_cents).to be > 0
    end
    

    it "have a quantity" do
      expect(subject.quantity).to be > 0
    end
    

    it "have a category" do
      expect(subject.category_id).to be > 0
    end


    it "rase error message when name = ' '" do
      product = Product.new(
      name: " ",
      price_cents: 22000,
      quantity: 10,
      category_id: 1)
      expect {raise "Name can't be blanck"}.to raise_error
      end
      
end