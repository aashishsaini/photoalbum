class Photo < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :gadget
  attr_accessible :gadget_photo , :gadget_id
  has_attached_file :gadget_photo, :styles => { :medium => "300x300>",
                                          :small  => "150x150>",
                                          :large =>   "400x400>",
                                          :thumb => "100x100>" },
                                          :default_url => "/images/:style/missing.png"
end
