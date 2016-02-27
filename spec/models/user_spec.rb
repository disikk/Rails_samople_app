require 'spec_helper'

RSpec.describe User, type: :model do
  before { @user = User.new(name: "Example User", email: "user@example.com") }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }

  it { should be_valid }

  describe "when name is not present" do
    before do
      @user.name = ""
    end
    it { should_not be_valid }
    after do
      @user.name = "Example User"
    end
  end
  describe "when email is not present" do
    before do
      @user.email = ""
    end
    it { should_not be_valid }
    after do
      @user.email = "user@example.com"
    end
  end
  describe "when name is too long" do
    before do
      @user.name = "a" * 51
    end
    it { should_not be_valid }
    after do
      @user.name = "Example User"
    end
  end
  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user@foo..com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).not_to be_valid
      end
      @user.email = "user@example.com"
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid
      end
      @user.email = "user@example.com"
    end
  end
  describe "when name is too short" do
    before do
      @user.name = "a" * 2
    end
    it { should_not be_valid }
    after do
      @user.name = "Example User"
    end
  end
  describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end

    it { should_not be_valid }
  end
end
