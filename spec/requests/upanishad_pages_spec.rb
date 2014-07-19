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
end
