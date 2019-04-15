class UserController < ApplicationController

  get '/signup' do
     erb :'/users/signup'
   end

   post '/signup' do
     if params[:username] != "" && params[:email] != "" && params[:password] != ""
           @user = User.create(params)
           @user.save
           session[:user_id] = @user.id
            redirect to '/lists/list'
        else
            redirect to '/users/signup'
         end
   end

   get '/login' do
      if !logged_in?
       erb :'/users/login'
      else
        redirect '/lists/list'
      end
    end

    post '/login' do
      @user = User.find_by(username: params[:username])
       if @user && @user.authenticate(params[:password])
           session[:user_id] = @user.id
           redirect '/lists/list'
           else
              redirect '/users/signup'
       end
    end

end
