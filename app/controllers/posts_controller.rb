# app/controllers/posts_controller.rb

class PostsController < ApplicationController
    before_action :authenticate, only: [:new, :create, :edit, :update, :destroy]
  
    def index
      @posts = Post.order(published_at: :desc)
    end
  
    def show
    end
  
    def new
      @post = Post.new
    end
  
    def create
      @post = Post.new(post_params)
  
      if @post.save
        redirect_to @post
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @post.update(post_params)
        redirect_to @post
      else
        render :edit
      end
    end
  
    def destroy
      @post.destroy
  
      redirect_to posts_path
    end
  
    private
  
    def set_post
      @post = Post.find(params[:id])
    end
  
    def post_params
      params.require(:post).permit(:title, :body, :published_at)
    end

    private

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      if username == "username" && password == "password"
        session[:authenticated] = true
      else
        session[:authenticated] = false
      end
    end
  end

  def authenticated?
    session[:authenticated]
  end
  helper_method :authenticated?

  end
  