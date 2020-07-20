require 'rails_helper'

RSpec.describe Book, type: :model do
  
  it "should be valid" do
    book = build_stubbed(:book)
    expect(book.valid?).to be true
  end

  it "should have name present" do
    book = build_stubbed(:book, :empty_name)
    expect(book.valid?).to be false
  end

  it "should have author present" do
    book = build_stubbed(:book, :empty_author)
    expect(book.valid?).to be false
  end

end