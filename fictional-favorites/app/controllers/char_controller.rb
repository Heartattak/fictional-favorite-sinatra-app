class CharController < ApplicationController

  get '/chars/list' do
    redirect_if_not_logged_in
    @chars = current_user.chars
    erb :'/chars/list'
  end

get '/chars/create_list' do
  redirect_if_not_logged_in
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
      if @char.user_id != current_user.id
        redirect 'chars/list'
      end
      if params[:name] != "" && params[:origin] != "" && current_user
        @char.update(name: params[:name])
        @char.update(origin: params[:origin])
        @char.save
        redirect '/chars/list'
      else
        redirect "/chars/#{params[:id]}/edit_char"
      end
end

  get '/chars/:id/delete_char' do
      @char = Char.find_by_id(params[:id])
      if @char.user_id == current_user.id
        erb :'/chars/delete_char'
      else
        redirect '/chars/list'
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
