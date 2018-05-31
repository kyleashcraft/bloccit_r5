module TopicsHelper
  def topics_authorized?
    current_user && current_user.admin?
  end 
end
