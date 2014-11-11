require 'spec_helper'

describe Verse do
  let(:upanishad) { FactoryGirl.create(:upanishad) }

  before do
   @verse = upanishad.verses.build(content: "Lorem ipsum", 
                                   upanishad_id: upanishad.id) 
  end
  subject { @verse }
  
  it { should respond_to(:content) } 
  it { should respond_to(:english) } 
  it { should respond_to(:position) } 
  it { should respond_to(:category) }  
  it { should respond_to(:comment) }  
  it { should be_valid }
  
  describe "when upanishad_id is not present" do
    before { @verse.upanishad_id = nil }
    it { should_not be_valid }
  end

  describe 'with blank content' do
    before { @verse.content = " " }
    it { should_not be_valid }
  end
 
  describe 'with blank category' do
    before { @verse.category = " " }
    it { should_not be_valid }
  end 
       
end
