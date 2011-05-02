class Opinion < ActiveRecord::Base

  default_scope :order => 'updated_at desc'

  belongs_to :topic, :class_name => 'Opinion'
  belongs_to :user

  has_many :ccs
  has_many :about_users, :through => :ccs, :source => :user

  acts_as_taggable

  before_save do
    self.tag_list = self.msg.scan(/#([^ #]+)#/).flatten
  end

  after_save do
    user_names = self.msg.scan(/@([^ ]+) ?/)
    self.about_users = User.find :all, :select => :id, :conditions => ['display_name in (?)', user_names.flatten]
  end
end
