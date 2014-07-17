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
  it { should respond_to(:index) } 
  
  it { should be_valid }
  
  describe "when upanishad_id is not present" do
    before { @verse.upanishad_id = nil }
    it { should_not be_valid }
  end
      
end
