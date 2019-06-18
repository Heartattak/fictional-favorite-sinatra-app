class CharController < ApplicationController


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
