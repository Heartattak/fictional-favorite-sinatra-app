require './config/environment'
require 'sinatra'
require 'sinatra/base'
require 'sinatra/flash'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    enable :sessions
    set :session_secret, "NMH"
    set :views, 'app/views'
    register Sinatra::Flash
  end

  get "/" do
    erb :index
  end

  helpers do
   def logged_in?
     !!current_user
   end

   def current_user
     @user ||= User.find_by(id: session[:user_id]) if session[:user_id]
   end

   def redirect_if_not_logged_in
     if !logged_in?
       redirect '/login'
     end
   end
 end
end
