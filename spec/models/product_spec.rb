require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    before do
      @category = Category.create!(name: "Furniture")
    end

    it 'validates presence with name' do
      product = Product.new(name: nil, price: 1300.00, quantity: 20, category: @category)
      product.valid?
      expect(product.errors[:name]).to include("can't be blank")
    end

    it 'validates presence with price' do
      product = Product.new(name: 'cozy bed', price: nil, quantity: 20, category: @category)
      product.valid?
      expect(product.errors[:price]).to include("can't be blank")
    end

    it 'validates presence with quantity' do
      product = Product.new(name: 'cozy bed', price: 1300.00, quantity: nil, category: @category)
      product.valid?
      expect(product.errors[:quantity]).to include("can't be blank")
    end

    it 'validates presence with category' do
      product = Product.new(name: 'cozy bed', price: 1300.00, quantity: 20, category: nil)
      product.valid?
      expect(product.errors.full_messages).to include("Category can't be blank")
    end

    it 'validates presence with all fields' do
      product = Product.new(name: 'cozy bed', price: 1300.00, quantity: 23, category: @category)
      product.valid?
      expect(product.errors.full_messages).to be_empty
    end
  end
end
