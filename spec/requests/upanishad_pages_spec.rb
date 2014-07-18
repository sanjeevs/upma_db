require 'spec_helper'

describe "UpanishadPages" do
  describe "visiting the index" do
    before { visit upanishads_path }
    subject { page }
    it { should have_selector('h1', text: 'All upanishads') }
  end
end
