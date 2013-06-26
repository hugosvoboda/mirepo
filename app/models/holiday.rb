class Holiday < ActiveRecord::Base
  attr_accessible :date, :description

  validates_presence_of :date, :description

  belongs_to :user
end
