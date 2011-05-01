class Opinion < ActiveRecord::Base

  default_scope :order => 'updated_at desc'

  belongs_to :topic, :class_name => 'Opinion'
  belongs_to :user

  acts_as_taggable

  def before_save
    self.tag_list = self.msg.scan(/#([^ #]+)#/).flatten
  end
end
