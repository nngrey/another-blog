class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Post created."
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def show
    if (params[:id]) == nil
      @post = Post.last
      @comment = Comment.new
    else
      @comment = Comment.new
      @post = Post.find(params[:id])
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "Post updated."
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Post deleted."
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :date, :body, :image, :date)
  end

end
