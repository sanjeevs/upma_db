require 'spec_helper'

describe User do

  before { @user = User.new(name: "Example user", email: "user@example.org") }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }

  it { should be_valid }

  describe "when email is not present" do
    before { @user.email = ' ' }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @user.name = "a" * 41 }
    it { should_not be_valid }
  end

  describe "when email is not valid" do
    it "should be invalid" do
      addresses = %w(users@foo,com user_at_foo.org example.user@foo.)
      addresses.each do |invalid_address|
        @user.email = invalid_address
        @user.should_not be_valid
      end
   end
  end
  
  describe "when email is valid" do
    it "should be valid" do
      addresses = %w(user@foo.com A@b.COM)
      addresses.each do |valid_address| 
        @user.email = valid_address
        @user.should be_valid 
      end
    end
  end

   describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end

    it { should_not be_valid }
   end
    
end
