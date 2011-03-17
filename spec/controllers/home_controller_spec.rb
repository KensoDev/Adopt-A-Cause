require 'spec_helper'

describe HomeController do
  render_views
  
  context "I am not logged in" do
    describe "GET 'index'" do
      it "should be successfull" do
        get :index
        response.should be_success
      end
      
      it "should have the right title" do
        get :index
        response.should have_selector("title", :content => "Welcome to our site!")
      end
      
      
    end
  end
end