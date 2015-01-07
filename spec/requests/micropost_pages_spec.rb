require 'spec_helper'

describe "micropost pages" do
  subject { page }

  describe "show page" do
    let(:micropost) { FactoryGirl.create(:micropost) }
    before { visit micropost_path(micropost) }

    it { should have_selector('h2', text: micropost.title) }
    it { should have_selector('h2', text: micropost.author) }
    it { should have_selector('h2', text: micropost.content) }
  end

  describe "create a micropost" do
    before { visit new_micropost_path }
    let(:submit) { "Create post" }

    describe "with invalid information" do
      it "should not create the micropost" do
        expect { click_button submit }.not_to change(Micropost, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Title", with: "Example Title"
        fill_in "Author", with: "Nobody Singh"
        fill_in "Content", with: "Dummy content"
      end

      it "should create the micropost" do
        expect { click_button submit }.to change(Micropost, :count).by(1)
      end
    end
  end
end
