enable :sessions

# get '/' do
# ## identify that "you are logged in top right"
# ## if logged in remove the "create a log in" anchor tag
#   if session[:email].nil?
#     erb :index
#   else
#     redirect('/profile')
#   end
# end

# post '/profile' do
#   valid_user = User.authenticate(params[:email], params[:password])
#   if valid_user
#     session[:email] = params[:email]
#     redirect("/profile")
#   else
#     redirect('/')
#   end
# end

# get '/profile' do
#   @user = User.find(session[:user_id])
#   erb :user_profile
# end

# get '/logout' do
#   session.clear
#   redirect('/')
# end

get '/create' do
  erb :create_new
end

post '/create' do
  User.create(fullname: params[:fullname], email: params[:email],
    password: params[:password])
  new_id = Url.where(user_id: session[:user_id])
  session[:user_id] = new_id
  redirect("/")
end





