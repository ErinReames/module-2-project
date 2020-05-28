require 'test_helper'

class UserTest < ActiveSupport::TestCase

    user1_params = {username: "John", phone: "123-867-5309", address: "123 Broadway, Seattle WA, 98122"}
    user2_params = {username: "Tim", phone: "123-456-7890", address: "3332 S Holly St, Seattle WA, 98102"}

    test "Should not save user without username" do
        user_params = user1_params.clone
        user_params.delete(:username)
        user = User.new(user_params)
        assert_not(user.save)
    end

    test "Should not save without unique username" do
        User.create(user1_params)
        user_params = user2_params.clone
        user_params[:username] = user1_params[:username]
        user = User.new(user_params)
        assert_not(user.save)
    end

    test "Should not save without phone" do
        user_params = user1_params.clone
        user_params.delete(:phone)
        user = User.new(user_params)
        assert_not(user.save)
    end

    test "Should not save without address" do
        user_params = user1_params.clone
        user_params.delete(:address)
        user = User.new(user_params)
        assert_not(user.save)
    end
    
end

