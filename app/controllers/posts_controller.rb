class PostsController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :search]
  before_action :set_post, only: [:edit, :show, :update, :destroy]
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
    @comment = Comment.new
    @comments = @post.comments.order(created_at: :desc)
    @like = Like.new
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
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

  def set_post
    @post = Post.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end


end
