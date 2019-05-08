class ListController < ApplicationController

  get '/lists/list' do
    if @user = User.find(session[:user_id])
    erb :'/lists/list'
  else
    redirect to :index
  end
end

  get '/create_list' do
     erb :'/lists/create_list'
   end

   post '/create_list' do
      if params[:name] != "" && params[:origin] != ""
        @char = Char.create(params)
        @char.save
      redirect to '/create_list'
   end
 end
end
