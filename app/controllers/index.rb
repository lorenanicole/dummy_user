enable :sessions

get '/' do
  if session[:email].nil?
    erb :index
  else
    redirect('/profile')
  end
end

post '/profile' do
  valid_user = User.authenticate(params[:email], params[:password])
  if valid_user
    session[:email] = params[:email]
    redirect("/profile")
  else
    redirect('/')
  end
end

get '/profile' do
  @user = User.where(email: session[:email]).first
  erb :user_profile
end

get '/logout' do
  session.clear
  redirect('/')
end

get '/create' do
  erb :create_new
end

post '/create' do
  User.create(fullname: params[:fullname], email: params[:email],
    password: params[:password])
  session[:email] = params[:email]
  redirect("/profile")
end





