class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :define_new_comment, except: [:create, :update, :destroy]

  def define_new_comment
    @comment = Comment.new
  end

  def index
    @comments = Comment.all.order("comments.created_at desc")
  end

  def new
  end

  def create
    @comment = Comment.new(params.require(:comment).permit(:comment, :user_id, :status_id))
    

    @comment.save
  
  end

  def show
    @comment = Comment.where(user_id: params[:id])
    render action: 'index'
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(params.require(:comment).permit(:comment))
       @comment.user_id=current_user.id
       redirect_to comments_path
    end 
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def destroy
  end
end
