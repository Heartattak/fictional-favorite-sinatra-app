class ListController < ApplicationController

  get '/lists/list' do
    if @user = User.find(session[:user_id])
    erb :'/lists/list'
  else
    erb :'/index'
  end
end

  get '/create_list' do
     erb :'/lists/create_list'
   end

   post '/create_list' do
      if params[:char][:name] != "" && params[:char][:origin] != ""
        @char = Char.create(params)
        @char.save
      erb :'/lists/list'
   end
 end
end
