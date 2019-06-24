class CharController < ApplicationController

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

  get '/chars/:id/edit_char' do
      @char = Char.find_by_id(params[:id])
      erb :'/chars/edit_char'
  end

  patch '/chars/:id' do
      @char = Char.find_by_id(params[:id])

    if params[:name] != "" && params[:origin] != "" && current_user
      @char.update(name: params[:name])
      @char.update(origin: params[:origin])
      @char.save
      redirect '/users/list'
    else
      redirect "/chars/edit_list"
  end
end

  get '/users/delete_list' do
    @char = current_user.chars
      erb :'/users/delete_list'
  end

  get '/chars/:id/delete_char' do
      @char = Char.find_by_id(params[:id])
      erb :'/chars/delete_char'
  end

  delete "/chars/:id" do
      @char = Char.find_by_id(params[:id])
      Char.destroy(params[:id]) if @char = current_user.chars
      redirect '/users/list'
    end
 end
