class Costumer < ActiveRecord::Base
  attr_accessible :email, :name

  validates_presence_of :email, :name

  belongs_to :user
end
