require 'spec_helper'

describe Upanishad do
  before { @upanishad = Upanishad.new(name: 'hello') }
  subject { @upanishad }

  it { should respond_to(:name) }

  it { should be_valid }
 
  it { should respond_to(:verses) } 
  describe "when name is not present" do
    before { @upanishad.name = nil }
    it { should_not be_valid }
  end

  describe "verse association" do
    before { @upanishad.save }
    let!(:second_verse) do
      FactoryGirl.create(:verse, upanishad: @upanishad, position: 1)
    end
    let!(:first_verse) do
      FactoryGirl.create(:verse, upanishad: @upanishad, position: 0)
    end

    it "should have the verse in the right order" do
      @upanishad.verses.should == [first_verse, second_verse]
    end
  end

end
