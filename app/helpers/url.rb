helpers do

  def assign_post_id(session_user_id)
    session_user_id == nil ? 4 : session_user_id
  end

end

