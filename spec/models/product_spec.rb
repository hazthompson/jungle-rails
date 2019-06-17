require 'rails_helper'

# RSpec.describe ProductSpec, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"


  RSpec.describe Product, type: :model do
    
    describe 'validations' do
    @category = Category.new
    product1 = Product.new(name: "Any name", price: 1000, quantity: 20, category: @category)
    
      it "is valid with valid attributes" do
        expect(product1).to be_valid
      end

      it "is not valid without a name" do
        product1.name = nil
        expect(product1).to_not be_valid
      end

      it "is not valid without a price" do
        product1.price = nil
        expect(product1).to_not be_valid
      end

      it "is not valid without a quantity" do
        product1.quantity = nil
        expect(product1).to_not be_valid
      end

      it "is not valid without a category" do
        product1.category = nil
        expect(product1).to_not be_valid
      end
    end
  end

# end

