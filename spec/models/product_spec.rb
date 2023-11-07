require 'rails_helper'

# RSpec.describe Product, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end


RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "Validates presence of name" do
      category = Category.create(name: "Electronics")
      product = Product.new(name: nil, price: 1000, quantity: 5, category_id: category.id)
      product.valid?
      expect(product.errors[:name]).to include("can't be blank")
      expect(product.errors.full_messages).to match_array(["Name can't be blank"])
    end

    it "Validates presence of price" do
      category = Category.create(name: "Electronics")
      product = Product.new(name: "Thermometer", quantity: 5, category_id:category.id)
      product.valid?
      expect(product.errors[:price]).to include("can't be blank")
    end
    it "Validates price is numerical" do
      category = Category.create(name: "Electronics")
      product = Product.new(name: "Thermometer", price: "banana", quantity: 5, category_id:category.id)
      product.valid?
      expect(product.errors[:price]).to include("is not a number")
    end

    it "Validates presence of quantity" do
      category = Category.create(name: "Electronics")
      product = Product.new(name: "Thermometer", price: 1000, quantity: nil, category_id: category.id)
      product.valid?
      expect(product.errors[:quantity]).to include("can't be blank")
      expect(product.errors.full_messages).to match_array(["Quantity can't be blank"])
    end

    it "Validates presence of category" do
      category = Category.create(name: nil)
      product = Product.new(name: "Thermometer", price: 1000, quantity: 5, category_id: category)
      product.valid?
      expect(product.errors[:category]).to include("can't be blank")
    end

    it "saves successfully when all fields are set" do
      category = Category.create(name: "Electronics")
      product = Product.new(name: "Thermometer", price: 1000, quantity: 5, category_id: category.id)
      expect(product).to be_valid
    end
  end
end
