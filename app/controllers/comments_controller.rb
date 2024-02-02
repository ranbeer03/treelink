# app/controllers/comments_controller.rb
class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @comments = Comment.all
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    # Adjusted to use :tree_id instead of :id
    @tree = Tree.friendly.find(params[:tree_id])
    @comment = @tree.comments.build(comment_params)
    @comment.user = current_user  # Assuming you have user authentication
    
    if @comment.save
      redirect_to @tree, notice: 'Comment was successfully added.'
    else
      # If saving the comment fails, you need to setup @comments for the trees/show view
      @comments = @tree.comments.includes(:user) # Load comments with user to avoid N+1 query
      render 'trees/show'
    end
  end
  
  
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment.tree, notice: 'Comment was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @comment.tree, notice: 'Comment was successfully deleted.'
  end
  
  
  
  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Strong parameters method
  def comment_params
    params.require(:comment).permit(:content, :tree_id)
  end
end
