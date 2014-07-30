require 'spec_helper'

describe "UpanishadPages" do
  subject { page }

  describe "index" do 
    before(:each) {
      visit upanishads_path
    }
    it { should have_selector('h1', text: 'All upanishads') }

    describe "pagination" do
      it { should have_selector('div', class: 'pagination') }
      it "should list each upanishad" do
        Upanishad.paginate(page: 1) do |upanishad|
         page.should have_selector('li', text:upanishad.name)
        end
      end
    end
  end

  describe "show page" do
    let(:upanishad) { FactoryGirl.create(:upanishad, name: "my-test") }
    let!(:v1) { FactoryGirl.create(:verse, upanishad: upanishad, content: "Foo", english: "Bar") }
    let!(:v2) { FactoryGirl.create(:verse, upanishad: upanishad, content: "Hello", english: "World") }

    before { visit upanishad_path(upanishad) }

    it { should have_selector('h1', text: upanishad.name) }
    it { should have_selector('title', text: upanishad.name) }

    describe "verses" do
      it { should have_content(v1.content) }
      it { should have_content(v2.content) }
      it { should have_content(upanishad.verses.count) }
      it { should_not have_link('edit') }
      describe "as a user" do
        let(:user) { FactoryGirl.create(:user) }
        before do
          sign_in user 
          visit upanishad_path(upanishad)
        end 
        it { should have_link('Edit') }
        it { should have_link('Delete') }
        it "should delete a verse" do
          expect { click_link "Delete" }.should change(Verse, :count).by(-1)
        end
      end
    end
   end

end
