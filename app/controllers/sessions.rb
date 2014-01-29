enable :sessions

post '/profile' do
  valid_user = User.authenticate(params[:email], params[:password])
  if valid_user
    new_id = User.where(email: params[:email]).first.id
    session[:user_id] = new_id
    redirect('/')
  else
   redirect('/')
  end
end

get '/logout' do
  session.clear
  puts session.empty?
  redirect('/')
end
