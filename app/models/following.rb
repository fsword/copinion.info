class Following < ActiveRecord::Base
  belongs_to :user
  belongs_to :follow, :polymorphic => false, :class_name => 'User'
end
