require 'rails_helper'

describe User, type: :model do

  it "should be valid" do
    user = build_stubbed(:user)
    expect(user.valid?).to be true
  end

  it "should have name present" do
    user = build_stubbed(:user, :empty_name)
    expect(user.valid?).to be false
  end

  it "should have email present" do
    user = build_stubbed(:user, :empty_email)
    expect(user.valid?).to be false
  end

  it "should accept valid email addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
      first.last@foo.jp alice+bob@baz.cn]
    user = build_stubbed(:user)
    valid_addresses.each do |valid_address|
      user.email = valid_address
      expect(user.valid?).to be true
    end
  end

  it "should not accept invalid email addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
      foo@bar_baz.com foo@bar+baz.com]
    user = build_stubbed(:user)
    invalid_addresses.each do |invalid_address|
      user.email = invalid_address
      expect(user.valid?).to be false
    end
  end

  it "should have unique email addresses" do
    user = create(:user)
    duplicate_user = user.dup
    duplicate_user.email = user.email.upcase
    # user.save
    expect(duplicate_user.valid?).to be false
  end

  it "should have password present (nonblank)" do
    user = build_stubbed(:user)
    user.password = user.password_confirmation = " " * 6
    expect(user.valid?).to be false
  end

  it "should have password of minimum length" do
    user = build_stubbed(:user)
    user.password_confirmation = user.password_confirmation = "a" * 5
    expect(user.valid?).to be false
  end

  it "should have email saved in lower case" do
    user = create(:user, :mixed_email)
    expect(!!(user.email =~ /[A-Z]/)).to be false
  end

end