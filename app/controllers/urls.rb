require 'pry'
enable :sessions

get '/' do
  @user_id = session[:user_id]
  @new_secret = session[:secret]
  # binding.pry
  @errors =  session[:error]
  # session[:user_id] == nil ? session_id = 4 : session_id = session[:user_id]
  @all_urls = Url.where(user_id: assign_post_id(session[:user_id]) )
  # binding.pry
  erb :index
end

post '/urls' do
  # session[:user_id] == nil ? session_id = 4 : session_id = session[:user_id]
  temp_url = Url.new(full_url: params[:new], click_counter: 0, user_id: assign_post_id(session[:user_id]) )
  temp_url.save
  # binding.pry
  if !temp_url.errors.empty?
    session[:error] = temp_url.errors.messages
    session[:secret] = nil
    redirect('/')
  else
    # binding.pry
    session[:secret] = Url.last.shortened_url
    session[:error] = {}
    redirect('/')
  end
  # create a new Url
end

# # e.g., /q6bda
get '/dbc/:short_url' do
  url = Url.where(shortened_url: "/dbc/#{params[:short_url]}").first
  url.click_counter += 1
  url.save
  # pry.binding
  # puts "#{url.full_url}"
  redirect("#{url.full_url}")
  # redirect to appropriate "long" URL
end
