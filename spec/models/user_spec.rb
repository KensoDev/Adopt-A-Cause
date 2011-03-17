require 'spec_helper'

describe User do
  it "should save a user" do
    @user = User.new(:first_name => "Avi", :last_name => "Tzurel", :email => "avi.kenso@gmail.com", :username => "KensoDev", :password => "foobar", :password_confirmation => "foobar")
    @user.save.should be_true
  end
  
  it "should validate the presence of a first name attribute" do
    @user = User.new(:last_name => "Tzurel", :email => "avi.kenso@gmail.com", :username => "KensoDev", :password => "foobar", :password_confirmation => "foobar")    
    @user.save.should be_false
  end
  
  it "should validate the presence of a last name" do
    @user = User.new(:first_name => "Avi", :email => "avi.kenso@gmail.com", :username => "KensoDev", :password => "foobar", :password_confirmation => "foobar")        
    @user.save.should be_false
  end
  
  it "should validate the username is unique" do
    @user = User.new(:last_name => "Tzurel", :first_name => "Avi", :email => "avi.kenso@gmail.com", :username => "KensoDev", :password => "foobar", :password_confirmation => "foobar")            
    @user.save
    
    @second_user = User.new(:last_name => "Glazer", :first_name => "Arieh", :email => "arieh.glazer@gmail.com", :username => "KensoDev", :password => "foobar", :password_confirmation => "foobar")            
    @second_user.save.should be_false
  end
end