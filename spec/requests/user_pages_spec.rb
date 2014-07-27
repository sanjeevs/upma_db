require 'spec_helper'

describe "UserPages" do
  subject { page }

  describe "signup page" do
    before { visit signup_path }

    
    it { should have_selector('h1', text: 'Sign in') }
    it { should have_selector('title', text: 'Sign in') }

    describe 'with role admin' do
      let(:admin) { FactoryGirl.create(:admin) }

      before do
        sign_in admin
      end
      it { should have_selector('h1', text: 'Sign up') }
      it { should have_selector('title', text: 'Sign up') }

      let(:submit) { "Create my account" }

      describe "with invalid information" do
        it "should not create a user" do
          expect { click_button submit }.not_to change(User, :count)
        end
      end

      describe "with valid information" do
        before do
          fill_in "Name", with: 'Example User'
          fill_in "Email", with: 'user@example.org'
          fill_in "Password", with: 'foobar'
          fill_in "Confirmation", with: 'foobar'
        end

        it "should create a user" do
         expect { click_button submit }.to change(User, :count).by(1)
        end
      end
     end
   end

   describe "index" do
    before do
      FactoryGirl.create(:user, name: "Bob", email: "bob@example.org")
      FactoryGirl.create(:user, name: "Ben", email: "ben@example.org")
      visit users_path
      sign_in FactoryGirl.create(:admin)
    end

    it { should have_selector('title', text: 'All users') }
    it { should have_selector('h1', text: 'All users') }
    it "should list each user" do
     User.all.each do |user|
      page.should have_selector('li', text: user.name)
     end
   end
  end
end
