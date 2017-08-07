require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    context 'given correct arguments' do
      it 'should create a user' do
        @user = User.new(
          first_name: 'Alice',
          last_name: 'Aliceson',
          email: 'Alice@alice.com',
          password: 'Alice',
          password_confirmation: 'Alice'
        )
        expect(@user.save).to be(true), @user.errors.full_messages.to_sentence
      end
    end

    context 'given correct arguments, but uppercase email' do
      it 'should create a user' do
        @user = User.new(
          first_name: 'Alice',
          last_name: 'Aliceson',
          email: 'ALICE@ALICE.com',
          password: 'Alice',
          password_confirmation: 'Alice'
        )
        expect(@user.save).to be(true), @user.errors.full_messages.to_sentence
      end
    end

    context 'given missing arguments' do
      it 'should not create user' do
        @user = User.new(
          first_name: 'Alice',
          last_name: 'Aliceson',
          email: nil,
          password: 'Alice',
          password_confirmation: 'Alice'
        )
        expect(@user.save).to be(false), @user.errors.full_messages.to_sentence
      end

      it 'should not create user' do
        @user = User.new(
          first_name: nil,
          last_name: 'Aliceson',
          email: 'Alie@alice.com',
          password: 'Alice',
          password_confirmation: 'Alice'
        )
        expect(@user.save).to be(false)
      end

      it 'should not create user' do
        @user = User.new(
          first_name: 'Alice',
          last_name: nil,
          email: 'Alie@alice.com',
          password: 'Alice',
          password_confirmation: 'Alice'
        )
        expect(@user.save).to be(false)
      end
    end

    context 'given nonmatching passwords' do
      it 'should not create user' do
        @user = User.new(
          first_name: 'Alice',
          last_name: 'Aliceson',
          email: 'Alice@alice.com',
          password: 'Alice',
          password_confirmation: 'NotAlice'
        )
        expect(@user.save).to be(false), @user.errors.full_messages.to_sentence
      end
    end

    context 'given 3length password' do
      it 'should not create user' do
        @user = User.new(
          first_name: 'Alice',
          last_name: 'Aliceson',
          email: 'Alice@alice.com',
          password: 'Ali',
          password_confirmation: 'Ali'
        )
        expect(@user.save).to be(false), @user.errors.full_messages.to_sentence
      end
    end

  end

  describe '.authenticate_with_credentials' do
    before do
      user = User.new(
        first_name: 'Alice',
        last_name: 'Aliceson',
        email: 'alice@alice.com',
        password: 'Alice',
        password_confirmation: 'Alice'
      )
      user.save
    end

    context 'given correct credentials' do
      it 'authenticate sucessfully' do
        @session = User.authenticate_with_credentials('  Alice@Alice.com', 'Alice')
        expect(@session).to_not be_nil
      end
    end

    context 'given incorrect credentials' do
      it 'return nil' do
        @session = User.authenticate_with_credentials('notan@email.com', 'eh')
        expect(@session).to be_nil
      end

    context 'given incorrect credentials' do
      it 'authenticate unsucessfully' do
        @session = User.authenticate_with_credentials(' ALICE@Alice.com', 'Alice')
        expect(@session).to_not be_nil
        end
      end
    end
  end
end
