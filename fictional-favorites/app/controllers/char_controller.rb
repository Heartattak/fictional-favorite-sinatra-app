class CharController < ApplicationController

  get '/chars/list' do
    if @char = current_user.chars
    erb :'/chars/list'
  else
    redirect to '/'
  end
end

get '/chars/create_list' do
  if @user.id == current_user.id
   erb :'/chars/create_list'
 end

 post '/create_list' do
    if params[:name] != "" && params[:origin] != "" && current_user
      @char = Char.create(params)
      @char.user = current_user
      @char.save
    redirect to '/chars/create_list'
  else
    redirect 'chars/list'
 end
end

  get '/chars/:id/edit_char' do
      @char = Char.find_by_id(params[:id])
      if @char.user_id == current_user.id
      erb :'/chars/edit_char'
    end
  end

  patch '/chars/:id' do
      @char = Char.find_by_id(params[:id])
      if @char.user_id == current_user.id
        if params[:name] != "" && params[:origin] != "" && current_user
          @char.update(name: params[:name])
          @char.update(origin: params[:origin])
          @char.save
        redirect '/chars/list'
      else
        redirect "/chars/#{params[:id]}/edit_char"
      end
    else
      redirect 'chars/list'
    end
end

  get '/chars/:id/delete_char' do
      @char = Char.find_by_id(params[:id])
      if @char.user_id == current_user.id
      erb :'/chars/delete_char'
    end
  end

  delete "/chars/:id" do
      @char = Char.find_by_id(params[:id])
      if @char.user_id == current_user.id
        Char.destroy(params[:id])
        redirect '/chars/list'
    else
      redirect '/chars/list'
    end
 end
 end
