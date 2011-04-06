class Opinion < ActiveRecord::Base
  belongs_to :topic, :class_name => 'Opinion'
  belongs_to :user
end
