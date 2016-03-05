require 'spec_helper'

describe "Authentication" do
  subject {page}

  describe "sign-in page" do
    before {visit signin_path}
    it {should have_title('Sign in')}
    it {should have_css('h1', text: 'Sign in')}
    it {should have_css('form', count: 1)}
    it {should have_css('form input[type=text]')}
    it {should have_css('form input[type=password]')}
    it {should have_css('form input[type=submit]')}

    describe "with invalid data" do
      before {find('form input[type=submit]').click}
      it {should have_title('Sign in')}
      it {should have_css('h1', text: 'Sign in')}
      it {should have_current_path(sessions_path)}
      it {should have_css('form', count: 1)}
      it {should have_css('.flash', count: 1, text: 'Некорректные логин и(или) пароль.')}

      describe "after visiting another page" do
        before {click_link 'Home'}
        it {should_not have_selector('.flash')}
      end
    end

    describe "with valid data" do
      let(:user) {FactoryGirl.create(:user)}
      before do
        find('form input[type=text]').set(user.email.upcase)
        find('form input[type=password]').set(user.password)
        find('form input[type=submit]').click
      end
      it { should have_title(user.name) }
      it { should have_current_path(user_path(user)) }
      it { should have_link('Profile',     href: user_path(user)) }
      it { should have_link('Sign out',    href: signout_path) }
      it { should_not have_link('Sign in', href: signin_path) }
    end
  end
end
