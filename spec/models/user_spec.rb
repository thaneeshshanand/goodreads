require 'rails_helper'

describe User, type: :model do
  
  before(:each) do
    @user = User.new(name: "Bruce Wayne",
                     email: "batman@gmail.com",
                     password: "foobar",
                     password_confirmation: "foobar")
  end

  it "should be valid" do
    expect(@user.valid?).to be true
  end

  it "should have name present" do
    @user.name = ""
    expect(@user.valid?).to be false
  end

  it "should have email present" do
    @user.email = ""
    expect(@user.valid?).to be false
  end

  it "should accept valid email addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
      first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      expect(@user.valid?).to be true
    end
  end

  it "should not accept invalid email addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
      foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      expect(@user.valid?).to be false
    end
  end

  it "should have unique email addresses" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    expect(duplicate_user.valid?).to be false
  end

  it "should have password present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    expect(@user.valid?).to be false
  end

  it "should have password of minimum length" do
    @user.password_confirmation = @user.password_confirmation = "a" * 5
    expect(@user.valid?).to be false
  end

  it "should have email saved in lower case" do
    mixed_email = "BATman@gmail.com"
    @user.email = mixed_email
    @user.save
    expect(@user.reload.email).to eq mixed_email.downcase
  end

end