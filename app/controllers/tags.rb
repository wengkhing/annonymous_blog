get '/tags/:t_id' do
  @tag = Tag.find(params[:t_id])
  erb :tag
end