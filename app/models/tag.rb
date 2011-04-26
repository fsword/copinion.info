class Tag < ActiveRecord::Base
  has_and_belongs_to_many :opinions  
  # todo refactory: throught
  
  scope :hots, order(:updated_at)
end
