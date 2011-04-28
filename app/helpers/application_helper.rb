module ApplicationHelper
  def current_user
    @curent_user ||= User.find_by_id( session[:user_id] ) if session[:user_id]
  end

  def hot_tag(size)
    ActsAsTaggableOn::Tag.order(:updated_at).limit(size)
  end
end
