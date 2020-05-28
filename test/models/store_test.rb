require 'test_helper'

class StoreTest < ActiveSupport::TestCase

  store1_params = {name: "Pets-R-us", address: "123 broadway, Seattle WA, 98122"}
  store2_params = {name: "Woof", address: "44297 Riverwinds Dr, Leonardtown MD, 45202"}

  test "Should not save without name" do
    store_params = store1_params.clone
    store_params.delete(:name)
    store = Store.new(store_params)
    assert_not(store.save)
  end


  test "Should not save without address" do
    store_params = store1_params.clone
    store_params.delete(:address)
    new_store = Store.new(store_params)
    assert_not(new_store.save)
  end

  test "Should not save without unique address" do
    Store.create(store1_params)
    store_params = store2_params.clone
    store_params[:address] = store1_params[:address]
    store = Store.new(store_params)
    assert_not(store.save)
  end

end