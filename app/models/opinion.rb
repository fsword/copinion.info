class Opinion < ActiveRecord::Base
  belongs_to :topic, :class_name => 'Opinion'
  belongs_to :user

  has_and_belongs_to_many :tags

  def after_save
    content = self.msg
    while content =~ /#([^#]+)#/
      tag = Tag.find_by_name $1
      self.tags << (tag || Tag.create(:name => $1))
      content = $'
    end
  end
end
