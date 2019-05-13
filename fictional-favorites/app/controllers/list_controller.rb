class ListController < ApplicationController

  get '/lists/list' do
    if @user = User.find(session[:user_id])
    erb :'/lists/list'
  else
    redirect to :index
  end
end

  get '/lists/create_list' do
     erb :'/lists/create_list'
   end

   post '/create_list' do
      if params[:name] != "" && params[:origin] != "" && !!current_user
        @char = Char.create(params)
        @char.user = current_user
        @char.save
      redirect to '/lists/create_list'
   end
 end

 get '/lists/logout' do
   session.clear
   redirect to :'/login'
 end
 end
