class PostsController < ApplicationController
  #  http_basic_authenticate_with name: "admin", password: "12345", except: [:index, :show] # пользователю без регистрации разрешено просматривать главную страницу и страницу отдельного поста
    
    def index
    	@post = Post.all # будут выводится все посты
    end

    def new
    	@post = Post.new
    end

    def show
    	@post = Post.find(params[:id]) #отображаем созданный пост
    end

    def edit
    	@post = Post.find(params[:id]) #отображаем нужный пост
    end

    def update
    	@post = Post.find(params[:id]) #отображаем нужный пост

    	if(@post.update(post_params)) # обновляем пост на отредактированный 
    		redirect_to @post #перенаправляем пользователя на навую страничку
    	  else
    		render 'edit' # перезагрузка странички edit
    	end
    end

    def destroy
    	@post = Post.find(params[:id]) #отображаем нужный пост

    	@post.destroy
    	redirect_to posts_path
    end

    def create
    	# render plain: params[:post].inspect
    	@post = Post.new(post_params) #обращаемся к нужной нам моделе Post.new, передаём в бд данные которые нужны из приватного метода

    	if(@post.save) # можем сохранить если проходит валлидацию
    	redirect_to @post #перенаправляем пользователя на навую страничку
    	else
    		render 'new' # перезагрузка странички new
    	end
    end

    private def post_params
    	params.require(:post).permit(:title, :body)
    	
    end
end
