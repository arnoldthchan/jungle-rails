require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before do
      @category = Category.new(name: "New One")
    end

    context 'given 4 arguments' do
      it 'should create a product' do
        @product = Product.new(
          name: 'name',
          description: 'description',
          image: 'apparel1.jpg',
          price_cents: 100,
          quantity: 3,
          category: @category
        )
        expect(@product.save).to be(true), @product.errors.full_messages.to_sentence
      end
    end

    context 'given no name' do
      it 'should not create a product' do
        @product = Product.new(
          name: nil,
          description: 'description',
          image: 'apparel1.jpg',
          price_cents: 100,
          quantity: 3,
          category: @category
        )
        expect(@product.save).to be(false), @product.errors.full_messages.to_sentence
      end
    end

    context 'given no price' do
      it 'should not create a product' do
        @product = Product.new(
          name: 'name',
          description: 'description',
          image: 'apparel1.jpg',
          price_cents: nil,
          quantity: 3,
          category: @category
        )
        expect(@product.save).to be(false), @product.errors.full_messages.to_sentence
      end
    end

    context 'given no quantity' do
      it 'should not create a product' do
        @product = Product.new(
          name: 'name',
          description: 'description',
          image: 'apparel1.jpg',
          price_cents: 100,
          quantity: nil,
          category: @category
        )
        expect(@product.save).to be(false), @product.errors.full_messages.to_sentence
      end
    end

  end
end

