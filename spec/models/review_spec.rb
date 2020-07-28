require 'rails_helper'

RSpec.describe Review, type: :model do
  
  it "should be valid" do
    review = build_stubbed(:review)
    expect(review.valid?).to be true
  end

  it "should have content present" do
    review = build_stubbed(:review, :empty_content)
    expect(review.valid?).to be false
  end

  it "shout not have invalid rating" do
    review = build_stubbed(:review, :invalid_rating)
    p review
    expect(review.valid?).to be false
  end

end