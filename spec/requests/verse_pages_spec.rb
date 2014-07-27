require 'spec_helper'

describe "VersePages" do
  let(:upanishad) { FactoryGirl.create(:upanishad, name: 'my-test') }
  let(:verse) { FactoryGirl.create(:verse, upanishad: upanishad, content: 'Foo', english: 'Bar') }
  subject { page }
  describe 'edit' do
    before { visit edit_verse_path(verse) }
    
    describe 'should require signin' do
      it { should have_selector('title', text: 'Sign in') }
    end

    describe "with valid user" do
      let(:user) { FactoryGirl.create(:user) }
      before { sign_in user }
      it { should have_selector('title', text: 'Edit verse') }

      describe 'with valid information' do
        let(:new_content) { "New Content" }
        let(:new_english) { "New English" }
        let(:new_category) { "Prayer" }

        before do
          fill_in "Content", with: new_content
          fill_in "English", with: new_english
          fill_in "Category", with: new_category
          click_button 'Save changes'
        end

        specify { verse.reload.content.should == new_content }
        specify { verse.reload.english.should == new_english }
        specify { verse.reload.category.should == new_category }
      end
    end

  end 

end
