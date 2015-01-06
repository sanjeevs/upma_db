require 'spec_helper'

describe Micropost do
  let(:micropost) { FactoryGirl.create(:micropost) }

  subject { micropost }

  it { should respond_to(:content) }
  it { should be_valid }

  describe "when author is not present" do
    before { micropost.author = nil }
    it { should_not be_valid }
  end

  describe "with blank title" do
    before { micropost.title = nil }
    it { should_not be_valid }
  end

  describe "with blank  content" do
    before { micropost.content = nil }
    it { should_not be_valid }
  end

  describe "with tweet too long" do
    before { micropost.tweet = "a" * 141 }
    it { should_not be_valid }
  end
end
