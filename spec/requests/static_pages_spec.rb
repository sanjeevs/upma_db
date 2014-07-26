require 'spec_helper'

describe "StaticPages" do
  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_selector('title', text: 'Home') }
    it { should have_link("Upanishad", href: upanishads_path) }
    it { should have_link("Sign in", href: signin_path) }
    it { should_not have_link("Users", href: users_path) }
    describe "as an user" do
      let(:user) { FactoryGril.create(:user) }
      before do
        sign_in user
      end
      it { should_not have_link("Users", href: users_path) }
      it { should have_link("Sign out", href: signout_path) }
    end
    describe "as an admin" do
      let(:admin) { FactoryGirl.create(:admin) }
      before do
        sign_in admin
      end
      it { should have_link("Users", href: users_path) }
      it { should have_link("Sign out", href: signout_path) }
    end
  end

  describe "Help page" do
    before { visit help_path }

    it { should have_selector('title', text: 'Help') }
  end

end
