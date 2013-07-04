class Gadget < ActiveRecord::Base
  attr_accessible :name, :user
  belongs_to :user
  has_many :photos , :dependent => :destroy
end
