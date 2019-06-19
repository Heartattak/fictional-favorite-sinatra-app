class UserController < ApplicationController

  get '/signup' do
     erb :'/users/signup'
   end

   post '/signup' do
     if params[:username] != "" && params[:email] != "" && params[:password] != ""
           @user = User.create(params)
           @user.save
           session[:user_id] = @user.id
            redirect to  '/users/list'
        else
            redirect to '/signup'
         end
   end

   get '/login' do
      if !logged_in?
        erb :'/users/login'
      else
        redirect to '/users/list'
      end
    end

    post '/login' do
      @user = User.find_by(username: params[:username])
       if @user && @user.authenticate(params[:password])
         session[:user_id] = @user.id
           redirect to '/users/list'
           else
            erb :'/users/signup'
       end
    end

    get '/users/list' do
      if @char = current_user.chars
      erb :'/users/list'
    else
      redirect to '/'
    end
  end

  get '/users/create_list' do
     erb :'/users/create_list'
   end

   post '/create_list' do
      if params[:name] != "" && params[:origin] != "" && current_user
        @char = Char.create(params)
        @char.user = current_user
        @char.save
      redirect to '/users/create_list'
   end
 end

 get '/users/edit_list' do
   @char = current_user.chars
    erb :'/users/edit_list'
  end

  get '/users/delete_list' do
    @char = current_user.chars
     erb :'/users/delete_list'
   end

    get '/logout' do
      session.clear
      redirect to :'/login'
    end

end
