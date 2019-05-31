class ListController < ApplicationController

  get '/lists/list' do
    if @char = current_user.chars
    erb :'/lists/list'
  else
    redirect to '/'
  end
end

  get '/lists/create_list' do
     erb :'/lists/create_list'
   end

   post '/create_list' do
      if params[:name] != "" && params[:origin] != "" && current_user
        @char = Char.create(params)
        @char.user = current_user
        @char.save
      redirect to '/lists/create_list'
   end
 end

 get '/lists/edit_list' do
   @char = Char.all
   if @char = current_user.chars
    erb :'/lists/edit_list'
  end
  end

  get '/lists/delete_list' do
    @char = Char.all
    if @char = current_user.chars
     erb :'/lists/delete_list'
   end
  end

 get '/lists/logout' do
   session.clear
   redirect to :'/login'
 end
 end
