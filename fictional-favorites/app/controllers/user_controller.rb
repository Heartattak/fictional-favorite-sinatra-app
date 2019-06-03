class UserController < ApplicationController

  get '/signup' do
     erb :'/users/signup'
   end

   post '/signup' do
     if params[:username] != "" && params[:email] != "" && params[:password] != ""
           @user = User.create(params)
           @user.save
           session[:user_id] = @user.id
            redirect to  '/lists/list'
        else
            redirect to '/signup'
         end
   end

   get '/login' do
      if !logged_in?
       erb :'/users/login'
      else
        redirect to '/lists/list'
      end
    end

    post '/login' do
      @user = User.find_by(username: params[:username])
       if @user && @user.authenticate(params[:password])
         session[:user_id] = @user.id
           redirect to '/lists/list'
           else
              erb :'/users/signup'
       end
    end

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
   @char = current_user.chars
    erb :'/lists/edit_list'
  end

    get '/logout' do
      session.clear
      redirect to :'/login'
    end

end
