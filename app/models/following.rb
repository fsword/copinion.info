class Following < ActiveRecord::Base
  belongs_to :user, :class_name => 'User', :foreign_key => 'user_id'
  belongs_to :foer, :class_name => 'User', :foreign_key => 'follow_id'
end
