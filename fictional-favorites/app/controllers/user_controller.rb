class UserController < ApplicationController

  get '/signup' do
     erb :'/users/signup'
   end

   post '/signup' do
     if params[:username] != "" && params[:email] != "" && params[:password] != ""
           @user = User.create(params)
           @user.save
           session[:user_id] = @user.id
            redirect to  '/chars/list'
        else
            redirect to '/signup'
         end
   end

   get '/login' do
      if !logged_in?
        erb :'/users/login'
      else
        redirect to '/chars/list'
      end
    end

    post '/login' do
      @user = User.find_by(username: params[:username])
       if @user && @user.authenticate(params[:password])
         session[:user_id] = @user.id
           redirect to '/chars/list'
           else
            erb :'/users/signup'
       end
    end

    get '/logout' do
      session.clear
      redirect to :'/login'
    end

end
