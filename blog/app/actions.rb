get '/' do
	@posts = Post.all
	erb :index
end

get '/about' do
	erb :about
end

get '/post/edit/:id' do
	@post = Post.find(params[:id].to_i)
	erb :"/post/edit"
end

post '/post/update/:id' do
	Post.find(params[:id].to_i).update(
		title: params[:title], 
		content: params[:content])
	redirect '/'
end

get '/post/new' do
	erb :"/post/new"
end

post '/post/new' do
	Post.create(title: params[:title],content: params[:content])
	redirect '/'
end

get '/post/:id' do
	@post = Post.find(params[:id].to_i)
	erb :"/post/index"
end

get '/comment/new' do
	@post_id = params[:id].to_i
	erb :"/comment/new"
end

post '/comment/:id' do
	Comment.create(user: params[:user],content: params[:content],post_id: params[:id])
	redirect :"/post/#{params[:id]}"
end