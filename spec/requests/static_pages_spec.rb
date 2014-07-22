require 'spec_helper'

describe "StaticPages" do
  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_selector('title', text: 'Home') }
  end

  describe "Help page" do
    before { visit help_path }

    it { should have_selector('title', text: 'Help') }
  end

end
