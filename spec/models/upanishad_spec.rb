require 'spec_helper'

describe Upanishad do
  before { @upanishad = Upanishad.new(name: 'hello') }
  subject { @upanishad }

  it { should respond_to(:name) }

  it { should be_valid }
  
  describe "when name is not present" do
    before { @upanishad.name = nil }
    it { should_not be_valid }
  end
end
