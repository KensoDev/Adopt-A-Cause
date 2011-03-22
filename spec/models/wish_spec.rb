require 'spec_helper'

describe Wish do
  before(:each) do
    @user = User.create!(:first_name => 'Avi', :last_name => 'Tzurel', :email => 'avi@kensodev.com', :password => 'foobar', :password_confirmation => 'foobar', :username => 'AviTzurel')
    @wish_attributes = {:name => 'This is my wish', :body => 'This is the wish body', :user => @user}
  end

  it "should not be saved without a name" do
    @wish = Wish.new(:body => 'This is my body', :user => @user)
    @wish.save.should be_false
  end
  
  it "should not save a with without a user" do
    @wish = Wish.new(:name => 'This is my wish', :body => 'This is the wish body')
    @wish.save.should be_false
  end
  
  it "should have many donations" do
    @wish = Wish.create!(@wish_attributes)
    @donation = Donation.create!(:wish => @wish, :user => @user, :amount => 12.5, :anonymus => false)
    
    @wish.donations.count.should == 1
  end

end