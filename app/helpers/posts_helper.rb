module PostsHelper
  def post_authorized?(post)
    current_user && (current_user == post.user || current_user.role == 'admin')
  end

end
