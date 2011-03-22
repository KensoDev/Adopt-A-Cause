require 'spec_helper'

describe Donation do
  before(:each) do
    @user = User.create!(:first_name => 'Avi', :last_name => 'Tzurel', :email => 'avi@kensodev.com', :password => 'foobar', :password_confirmation => 'foobar', :username => 'AviTzurel')
    @wish = Wish.new(:name => 'This is my wish', :body => 'This is the body', :user => @user)
    
    @donation_attibutes = {:amount => 12.5, :wish => @wish, :user => @user, :anonymus => false}
  end
  
  it "should save the donation" do
    @donation = Donation.new(@donation_attibutes)
    @donation.save.should be_true    
  end
  
  
  it "should not save without user" do
    @donation = Donation.new(@donation_attibutes.merge({:user => nil}))
    @donation.save.should be_false
  end
  
  it "should not save without wish" do
    @donation = Donation.new(@donation_attibutes.merge({:wish => nil}))
    @donation.save.should be_false
  end
  
  it "shold validate that amount is numeric" do
    @donation = Donation.new(@donation_attibutes.merge({:amount => 'ha ha ha'}))    
    @donation.save.should be_false
  end
  
  
end