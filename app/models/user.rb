class User < ActiveRecord::Base
  def self.auth_with_openid openid
    u = find_by_openid openid
    if u.nil?
      Rails.logger.info "尚不存在，创建之!"
      u = User.create( :openid => openid, :last_visited_at => Time.now )
    elsif u != nil
      u.update_attribute :last_visited_at, Time.now
    end
    return u
  end

  def self.guest
    User.new :openid => 'guest'
  end
end
