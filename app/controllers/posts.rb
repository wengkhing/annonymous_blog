get '/posts/:p_id' do
  @post = Post.find(params[:p_id])
  @post.click_count += 1
  @post.save
  erb :post
end

get '/posts/edit/:p_id' do
  @post = Post.find(params[:p_id])
  erb :edit_post
end

get '/posts/delete/:p_id' do
  post = Post.find(params[:p_id])
  post.destroy
  erb :delete_post
end

get '/new/posts' do
  erb :new_post
end

post '/new/posts/submit' do
  post = Post.create(title: params[:title], body: params[:body], click_count: 0)
  tags_name = params[:tags].split(",")
  tags_name.each do |t_name|
    t = Tag.where(name: t_name).first
    if t == nil
      t = Tag.create(name: t_name)
    end
    Tagging.create(post: post, tag: t)
  end
  erb :submit_post
end

post '/posts/:p_id/edit' do
  post = Post.find(params[:p_id])
  post.title = params[:title]
  post.body = params[:body]
  input_tag_names = params[:tags].split(",")
  input_tag_names.each do |itn|
    unless post.tags.map{|x| x.name}.include? itn
      t = Tag.where(name: itn).first
      if t == nil
        t = Tag.create(name: itn)
      end
      Tagging.create(post: post, tag: t)
    end
  end
  post.save
  erb :submit_post
end