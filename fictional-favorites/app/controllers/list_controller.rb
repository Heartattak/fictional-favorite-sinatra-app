class ListController < ApplicationController

  get '/lists/delete_list' do
    @char = current_user.chars
     erb :'/lists/delete_list'
   end

 get '/lists/logout' do
   session.clear
   redirect to :'/login'
 end
end
