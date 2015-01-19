require 'spec_helper'

describe "VersePages" do
  let(:upanishad) { FactoryGirl.create(:upanishad, name: 'my-test') }
  let(:verse) { FactoryGirl.create(:verse, upanishad: upanishad, content: 'Foo', english: 'Bar') }
  subject { page }

  describe 'show' do
    before { visit verse_path(verse) }

    describe 'it should show the verse' do
      it { should have_selector('title', text: 'Show verse') }
      it { should have_content('Foo') }
    end
  end

  describe 'index' do
    before { visit verses_path }
    it { should have_selector('title', text: 'All Verses') }
  end

  describe 'edit' do
    before { visit edit_verse_path(verse) }
    
    describe 'should require signin' do
      it { should have_selector('title', text: 'Sign in') }
    end

    describe "with valid user" do
      let(:user) { FactoryGirl.create(:user) }
      before { sign_in user }
      it { should have_selector('title', text: 'Edit verse') }

      describe 'edit information' do
        let(:new_content) { "New Content" }
        let(:new_english) { "New English" }
        let(:new_comment) { "New Comment" }

        before do
          fill_in "Content", with: new_content
          fill_in "English", with: new_english
          fill_in "Comment", with: new_comment
          click_button 'Save changes'
        end

        specify { verse.reload.content.should == new_content }
        specify { verse.reload.english.should == new_english }
        specify { verse.reload.comment.should == new_comment}
      end

    end
  end 
end
