class User < ActiveRecord::Base

  has_many :opinions

  has_many :followings, :foreign_key => 'follow_id'
  has_many :foers, :through => :followings, :source => :user

  def self.auth_with_openid openid, display_name=openid
    u = find_by_openid openid
    if u.nil?
      Rails.logger.info "尚不存在，创建之!"
      u = User.create(
          :openid => openid, :display_name => display_name,
          :last_visited_at => Time.now, :img_path => "/images/rails.png", :zone => '中国'
      )
    elsif u != nil
      u.update_attribute :last_visited_at, Time.now
    end
    return u
  end

  def before_create
    if self.display_name.nil?
      self.display_name = self.openid
    end
  end
end
