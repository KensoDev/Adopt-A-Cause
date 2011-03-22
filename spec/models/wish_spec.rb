require 'spec_helper'

describe Wish do
  before(:each) do
    @user = User.create!(:first_name => 'Avi', :last_name => 'Tzurel', :email => 'avi@kensodev.com', :password => 'foobar', :password_confirmation => 'foobar')
  end

  it "should not be saved without a name" do
    @wish = Wish.new(:body => "This is the body")
    @wish.save.should be_false
  end
  
  it "should not save a with without a user" do
    @wish = Wish.new(:name => 'This is my wish', :body => 'This is the wish body')
    @wish.save.should be_false
  end
  
end
