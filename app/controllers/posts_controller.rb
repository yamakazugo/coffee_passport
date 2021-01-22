class PostsController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :search]
  def index
    @posts = Post.includes(:user).order("created_at DESC").page(params[:page]).per(8)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.order(created_at: :desc)
    @like = Like.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if current_user.id == @post.user_id
       @post.destroy
      redirect_to root_path
    else 
      render :show
    end
  end

  def search
    @posts = Post.search(params[:keyword])
  end


  private
  def post_params
    params.require(:post).permit(:image, :name, :info, :flavor_id, :region_id, :body_id, :acidity_id, :processing_id, :text).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end


end
