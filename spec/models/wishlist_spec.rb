require 'rails_helper'

RSpec.describe Wishlist, type: :model do

  it "should be valid" do
    wishlist = build_stubbed(:wishlist)
    expect(wishlist.valid?).to be true
  end

  it "should have user present" do
    wishlist = build_stubbed(:wishlist, :empty_user)
    expect(wishlist.valid?).to be false
  end

  it "should have book present" do
    wishlist = build_stubbed(:wishlist, :empty_book)
    expect(wishlist.valid?).to be false
  end

end