class CharController < ApplicationController

  get '/chars/:id/edit_char' do
    @char = Char.find_by_id(params[:id])
    erb :'/chars/edit_char'
  end

  patch '/chars/:id/edit_char' do
    binding.pry
  @char = Char.find_by_id(params[:id])

    if params[:name] != "" && params[:origin] != "" && current_user
    @char.update(params[:name], params[:origin])
    @char.save
    redirect '/lists/list'
  else
    redirect "/chars/edit_list"
  end
end

delete "/chars/:id" do
  @char = Char.find_by_id(params[:id])
  Char.destroy(params[:id]) if @char = current_user.chars
  redirect '/lists/list'
end
 end
