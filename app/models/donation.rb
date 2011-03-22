class Donation < ActiveRecord::Base
  belongs_to :wish, :class_name => "Wish", :foreign_key => "wish_id"
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"

  
  validates_presence_of :user, :on => :create, :message => "can't be blank"
  validates_presence_of :wish, :on => :create, :message => "can't be blank"
  
  validates_numericality_of :amount
  

end