class Tag < ActiveRecord::Base
  has_many :opinions
  has_and_belongs_to_many :opinions  
end
