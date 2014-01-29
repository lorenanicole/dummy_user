helpers do

  def find_session_id(params_email)
    User.where(email: params_email).first.id
  end

end

