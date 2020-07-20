require 'rails_helper'

RSpec.describe Author, type: :model do

  it "should be valid" do
    author = build_stubbed(:author)
    expect(author.valid?).to be true
  end

  it "should have name present" do
    author = build_stubbed(:author, :empty_name)
    expect(author.valid?).to be false
  end
  
end