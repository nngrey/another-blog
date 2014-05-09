class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:notice] = "New comment created."
      respond_to do |format|
        format.html { redirect_to post_path(@comment.post_id) }
        format.js
      end
    else
      render 'new'
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      flash[:notice]="Comment updated."
      redirect_to post_path(@comment.post_id)
    else
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    id = @comment.post_id
    @comment.destroy
    flash[:notice] = "Comment deleted."
    redirect_to post_path(@comment.post_id)
  end

private

  def comment_params
    params.require(:comment).permit(:date, :body, :post_id, :name, :user_id)
  end
end