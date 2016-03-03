require 'spec_helper'

describe 'User pages' do

  subject { page }

  describe "signup page" do
    before { visit signup_path }
    let(:submit) { 'Register me' }

    it { should have_content('Sign up') }
    it { should have_title(full_title('Sign up')) }

    describe "with invalid data" do
      it "should not create user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end
    describe "with valid data filled in fields" do
      before do
        fill_in "user[name]",         with: "Example User"
        fill_in "user[email]",        with: "user@example.com"
        fill_in "user[password]",     with: "foobar"
        fill_in "user[password_confirmation]", with: "foobar"
      end
      it "should create new user" do
        expect  { click_button submit }.to change(User, :count)
      end
    end
  end

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_content(user.name) }
    it { should have_title(user.name) }
  end
end